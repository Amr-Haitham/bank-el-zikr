import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../repositories/counter_repository.dart';

/// Use case for incrementing the account balance
class IncrementBalance implements UseCase<void, NoParams> {
  final CounterRepository repository;

  IncrementBalance(this.repository);

  @override
  Future<RequestResult<void>> call(NoParams params) async {
    return await repository.incrementAccountBalance();
  }
}
