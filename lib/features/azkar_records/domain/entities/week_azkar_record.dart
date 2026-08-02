import 'package:equatable/equatable.dart';
import 'day_record.dart';

/// Aggregated data for a week's worth of azkar records
class WeekAzkarRecord extends Equatable {
  final List<DayRecordEntity> dailyRecords;
  final Map<String, int> totalCountsByZikrKey;
  final Map<String, int> todayCountsByZikrKey;

  const WeekAzkarRecord({
    required this.dailyRecords,
    required this.totalCountsByZikrKey,
    required this.todayCountsByZikrKey,
  });

  factory WeekAzkarRecord.fromDailyRecords(
      List<DayRecordEntity> dailyRecords) {
    final Map<String, int> totalCounts = {};
    final Map<String, int> todayCounts =
        dailyRecords.isEmpty ? {} : dailyRecords.first.repsByZikrKey;

    for (var dayRecord in dailyRecords) {
      for (var entry in dayRecord.repsByZikrKey.entries) {
        totalCounts[entry.key] = (totalCounts[entry.key] ?? 0) + entry.value;
      }
    }

    return WeekAzkarRecord(
      dailyRecords: dailyRecords,
      totalCountsByZikrKey: totalCounts,
      todayCountsByZikrKey: todayCounts,
    );
  }

  @override
  List<Object?> get props =>
      [dailyRecords, totalCountsByZikrKey, todayCountsByZikrKey];
}
