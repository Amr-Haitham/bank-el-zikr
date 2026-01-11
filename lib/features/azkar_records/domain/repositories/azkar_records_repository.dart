import '../../../../core/constants/type_definitions.dart';
import '../entities/day_zikr_record.dart';

abstract class AzkarRecordsRepository {
  /// Get all azkar records (7-day window)
  Future<RequestResult<List<DayZikrRecord>>> getAllRecords();

  /// Update all records (used after fixing/maintaining 7-day window)
  Future<RequestResult<void>> updateAllRecords(List<DayZikrRecord> records);

  /// Increment a specific zikr's count for today
  Future<RequestResult<void>> incrementZikrRecord(int zikrId);

  /// Delete all records for a specific zikr
  Future<RequestResult<void>> deleteZikrRecord(int zikrId);
}
