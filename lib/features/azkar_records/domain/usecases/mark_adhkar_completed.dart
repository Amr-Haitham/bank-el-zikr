import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../repositories/daily_activity_log_repository.dart';

class MarkAdhkarCompleted implements UseCase<void, String> {
  final DailyActivityLogRepository repository;

  MarkAdhkarCompleted(this.repository);

  @override
  Future<RequestResult<void>> call(String category) {
    return repository.markAdhkarCompleted(category);
  }
}
