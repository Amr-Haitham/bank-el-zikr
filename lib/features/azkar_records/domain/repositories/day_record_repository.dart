import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/day_record.dart';

abstract class DayRecordRepository {
  /// All days on record, unbounded, most-recent-first.
  Future<RequestResult<List<DayRecordEntity>>> getAll();

  /// Increment a specific zikr's count for today.
  Future<RequestResult<void>> logZikrIncrement(String zikrKey);

  /// Mark a tracked-daily category (morning/evening/sleep) complete for today.
  Future<RequestResult<void>> markCategoryCompleted(String category);

  /// Remove a zikr's counts from every day on record (used when deleting a
  /// custom zikr, so stale history doesn't linger under a dead key).
  Future<RequestResult<void>> deleteZikrRecord(String zikrKey);
}
