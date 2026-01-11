import 'package:hive/hive.dart';
import '../models/day_zikr_record_model.dart';

/// Abstract interface for azkar records local data source
abstract class AzkarRecordsLocalDataSource {
  /// Get all records from local storage (7-day window)
  Future<List<DayZikrRecordModel>> getAllRecords();

  /// Update all records in local storage
  Future<void> updateAllRecords(List<DayZikrRecordModel> records);

  /// Increment a specific zikr's count for today
  Future<void> incrementZikrRecord(int zikrId);

  /// Delete all records for a specific zikr
  Future<void> deleteZikrRecord(int zikrId);
}

/// Implementation of AzkarRecordsLocalDataSource using Hive
class AzkarRecordsLocalDataSourceImpl implements AzkarRecordsLocalDataSource {
  final Box<DayZikrRecordModel> box;

  AzkarRecordsLocalDataSourceImpl({required this.box});

  @override
  Future<List<DayZikrRecordModel>> getAllRecords() async {
    // Get all records from the box and return as a list
    return box.values.toList();
  }

  @override
  Future<void> updateAllRecords(List<DayZikrRecordModel> records) async {
    // Clear the box and add all new records
    await box.clear();
    for (var i = 0; i < records.length; i++) {
      await box.put(i, records[i]);
    }
  }

  @override
  Future<void> incrementZikrRecord(int zikrId) async {
    // Get the first record (today's record)
    final todayRecord = box.getAt(0);
    if (todayRecord == null) {
      throw Exception('No record found for today');
    }

    // Increment the count for this zikr
    final currentCount = todayRecord.azkarRecordById[zikrId] ?? 0;
    todayRecord.azkarRecordById[zikrId] = currentCount + 1;

    // Save the updated record
    await todayRecord.save();
  }

  @override
  Future<void> deleteZikrRecord(int zikrId) async {
    for (var i = 0; i < box.length; i++) {
      final record = box.getAt(i);
      if (record != null && record.azkarRecordById.containsKey(zikrId)) {
        record.azkarRecordById.remove(zikrId);
        await box.putAt(i, record);
      }
    }
  }
}
