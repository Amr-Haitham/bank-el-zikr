import 'package:equatable/equatable.dart';
import 'day_zikr_record.dart';

/// Aggregated data for a week's worth of azkar records
class WeekAzkarRecord extends Equatable {
  final List<DayZikrRecordEntity> dailyRecords;
  final Map<int, int> totalCountsByZikrId;
  final Map<int, int> todayCountsByZikrId;

  const WeekAzkarRecord({
    required this.dailyRecords,
    required this.totalCountsByZikrId,
    required this.todayCountsByZikrId,
  });

  factory WeekAzkarRecord.fromDailyRecords(
      List<DayZikrRecordEntity> dailyRecords) {
    final Map<int, int> totalCounts = {};
    final Map<int, int> todayCounts =
        dailyRecords.isEmpty ? {} : dailyRecords.first.azkarRecordById;

    for (var dayRecord in dailyRecords) {
      for (var entry in dayRecord.azkarRecordById.entries) {
        totalCounts[entry.key] = (totalCounts[entry.key] ?? 0) + entry.value;
      }
    }

    return WeekAzkarRecord(
      dailyRecords: dailyRecords,
      totalCountsByZikrId: totalCounts,
      todayCountsByZikrId: todayCounts,
    );
  }

  @override
  List<Object?> get props =>
      [dailyRecords, totalCountsByZikrId, todayCountsByZikrId];
}
