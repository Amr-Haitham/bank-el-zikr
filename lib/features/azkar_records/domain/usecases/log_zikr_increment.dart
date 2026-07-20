import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../repositories/daily_activity_log_repository.dart';

class LogZikrIncrement implements UseCase<void, int> {
  final DailyActivityLogRepository repository;

  LogZikrIncrement(this.repository);

  @override
  Future<RequestResult<void>> call(int zikrId) {
    return repository.logZikrIncrement(zikrId);
  }
}
