import 'package:equatable/equatable.dart';

/// A single day's worth of spiritual-activity data, kept indefinitely
/// (unlike [DayZikrRecordEntity]'s pruned 7-day rolling window) so that
/// real streaks, "longest streak", and month/year history can be computed.
class DailyActivityEntry extends Equatable {
  final DateTime date;
  final Map<int, int> zikrCounts;
  final bool morningCompleted;
  final bool eveningCompleted;

  const DailyActivityEntry({
    required this.date,
    required this.zikrCounts,
    required this.morningCompleted,
    required this.eveningCompleted,
  });

  int get totalZikrCount => zikrCounts.values.fold(0, (a, b) => a + b);

  bool get isActive =>
      totalZikrCount > 0 || morningCompleted || eveningCompleted;

  DailyActivityEntry copyWith({
    Map<int, int>? zikrCounts,
    bool? morningCompleted,
    bool? eveningCompleted,
  }) {
    return DailyActivityEntry(
      date: date,
      zikrCounts: zikrCounts ?? this.zikrCounts,
      morningCompleted: morningCompleted ?? this.morningCompleted,
      eveningCompleted: eveningCompleted ?? this.eveningCompleted,
    );
  }

  @override
  List<Object?> get props =>
      [date, zikrCounts, morningCompleted, eveningCompleted];
}
