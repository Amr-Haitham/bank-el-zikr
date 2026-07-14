import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/daily_activity_entry.dart';

abstract class DailyActivityLogRepository {
  Future<RequestResult<List<DailyActivityEntry>>> getAll();
  Future<RequestResult<void>> logZikrIncrement(int zikrId);
  Future<RequestResult<void>> markAdhkarCompleted(String category);
}
