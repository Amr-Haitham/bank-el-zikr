import 'day_record.dart';

enum GrowthPeriod { week, month, year }

class GrowthPoint {
  final DateTime date;
  final int value;
  const GrowthPoint({required this.date, required this.value});
}

class WeeklyGridDay {
  final DateTime date;
  final bool hasMorning;
  final bool hasEvening;
  final bool hasSleep;
  final bool hasZikr;
  final bool isToday;

  const WeeklyGridDay({
    required this.date,
    required this.hasMorning,
    required this.hasEvening,
    required this.hasSleep,
    required this.hasZikr,
    required this.isToday,
  });
}

/// Pure computation over the full (unpruned) [DayRecordEntity] history,
/// used to feed the Journey screen with real streaks / longest-streaks /
/// weekly grid / growth-chart data instead of hardcoded numbers.
class JourneyStats {
  final List<DayRecordEntity> entries;

  JourneyStats(this.entries);

  DateTime get _today {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  int _currentStreak(bool Function(DayRecordEntity) predicate) {
    final activeDates = entries.where(predicate).map((e) => e.date).toSet();
    DateTime cursor = _today;
    if (!activeDates.contains(cursor)) {
      cursor = cursor.subtract(const Duration(days: 1));
    }
    int streak = 0;
    while (activeDates.contains(cursor)) {
      streak++;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    return streak;
  }

  int _longestStreak(bool Function(DayRecordEntity) predicate) {
    final activeDates =
        entries.where(predicate).map((e) => e.date).toSet().toList()..sort();
    int longest = 0;
    int current = 0;
    DateTime? prev;
    for (final date in activeDates) {
      if (prev != null && date.difference(prev).inDays == 1) {
        current++;
      } else {
        current = 1;
      }
      longest = current > longest ? current : longest;
      prev = date;
    }
    return longest;
  }

  int get overallCurrentStreak => _currentStreak((e) => e.isActive);
  int get overallLongestStreak => _longestStreak((e) => e.isActive);

  int get morningCurrentStreak => _currentStreak((e) => e.morningCompleted);
  int get morningLongestStreak => _longestStreak((e) => e.morningCompleted);

  int get eveningCurrentStreak => _currentStreak((e) => e.eveningCompleted);
  int get eveningLongestStreak => _longestStreak((e) => e.eveningCompleted);

  int get sleepCurrentStreak => _currentStreak((e) => e.sleepCompleted);
  int get sleepLongestStreak => _longestStreak((e) => e.sleepCompleted);

  DayRecordEntity? _entryForDate(DateTime date) {
    for (final e in entries) {
      if (e.date == date) return e;
    }
    return null;
  }

  /// Last 7 calendar days (oldest first, ending today).
  List<WeeklyGridDay> get weeklyGrid {
    final today = _today;
    return List.generate(7, (i) {
      final date = today.subtract(Duration(days: 6 - i));
      final entry = _entryForDate(date);
      return WeeklyGridDay(
        date: date,
        hasMorning: entry?.morningCompleted ?? false,
        hasEvening: entry?.eveningCompleted ?? false,
        hasSleep: entry?.sleepCompleted ?? false,
        hasZikr: (entry?.totalZikrCount ?? 0) > 0,
        isToday: date == today,
      );
    });
  }

  /// Count of active days (morning/evening/sleep/zikr) within the last 7 days.
  int get activeDaysThisWeek => weeklyGrid
      .where((d) => d.hasMorning || d.hasEvening || d.hasSleep || d.hasZikr)
      .length;

  int _totalZikrOn(DateTime date) => _entryForDate(date)?.totalZikrCount ?? 0;

  List<GrowthPoint> growthPoints(GrowthPeriod period) {
    final today = _today;
    switch (period) {
      case GrowthPeriod.week:
        return List.generate(7, (i) {
          final date = today.subtract(Duration(days: 6 - i));
          return GrowthPoint(date: date, value: _totalZikrOn(date));
        });
      case GrowthPeriod.month:
        return List.generate(30, (i) {
          final date = today.subtract(Duration(days: 29 - i));
          return GrowthPoint(date: date, value: _totalZikrOn(date));
        });
      case GrowthPeriod.year:
        return List.generate(12, (i) {
          final month = DateTime(today.year, today.month - (11 - i), 1);
          final total = entries
              .where((e) =>
                  e.date.year == month.year && e.date.month == month.month)
              .fold<int>(0, (sum, e) => sum + e.totalZikrCount);
          return GrowthPoint(date: month, value: total);
        });
    }
  }

  /// % change of this period's total vs. the previous equal-length period.
  /// Returns null when there's no prior-period data to compare against
  /// (nothing meaningful to report yet), rather than a made-up number.
  double? growthPercentChange(GrowthPeriod period) {
    final points = growthPoints(period);
    final currentTotal = points.fold<int>(0, (sum, p) => sum + p.value);

    final today = _today;
    int previousTotal;
    switch (period) {
      case GrowthPeriod.week:
        previousTotal = List.generate(7, (i) {
          final date = today.subtract(Duration(days: 13 - i));
          return _totalZikrOn(date);
        }).fold<int>(0, (a, b) => a + b);
        break;
      case GrowthPeriod.month:
        previousTotal = List.generate(30, (i) {
          final date = today.subtract(Duration(days: 59 - i));
          return _totalZikrOn(date);
        }).fold<int>(0, (a, b) => a + b);
        break;
      case GrowthPeriod.year:
        previousTotal = 0;
        for (var i = 0; i < 12; i++) {
          final month = DateTime(today.year - 1, today.month - (11 - i), 1);
          previousTotal += entries
              .where((e) =>
                  e.date.year == month.year && e.date.month == month.month)
              .fold<int>(0, (sum, e) => sum + e.totalZikrCount);
        }
        break;
    }

    if (previousTotal == 0) return null;
    return ((currentTotal - previousTotal) / previousTotal) * 100;
  }

  /// zikrKey -> total count, summed over the last [days] days.
  Map<String, int> zikrTotalsOverLastDays(int days) {
    final today = _today;
    final cutoff = today.subtract(Duration(days: days - 1));
    final Map<String, int> totals = {};
    for (final e in entries) {
      if (e.date.isBefore(cutoff)) continue;
      for (final entry in e.repsByZikrKey.entries) {
        totals[entry.key] = (totals[entry.key] ?? 0) + entry.value;
      }
    }
    return totals;
  }
}
