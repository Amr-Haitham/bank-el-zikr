import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/daily_activity_entry.dart';
import '../repositories/daily_activity_log_repository.dart';

class GetDailyActivityLog
    implements UseCase<List<DailyActivityEntry>, NoParams> {
  final DailyActivityLogRepository repository;

  GetDailyActivityLog(this.repository);

  @override
  Future<RequestResult<List<DailyActivityEntry>>> call(NoParams params) {
    return repository.getAll();
  }
}
