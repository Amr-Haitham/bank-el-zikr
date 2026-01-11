import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../entities/counter_state.dart';
import '../repositories/counter_repository.dart';

/// Use case for getting the current counter state
class GetCounterState implements UseCase<CounterStateEntity, NoParams> {
  final CounterRepository repository;

  GetCounterState(this.repository);

  @override
  Future<RequestResult<CounterStateEntity>> call(NoParams params) async {
    return await repository.getCounterState();
  }
}
