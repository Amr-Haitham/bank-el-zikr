import '../../../../core/constants/type_definitions.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/counter_repository.dart';

/// Use case for updating the counter value
class UpdateCounter implements UseCase<void, UpdateCounterParams> {
  final CounterRepository repository;

  UpdateCounter(this.repository);

  @override
  Future<RequestResult<void>> call(UpdateCounterParams params) async {
    return await repository.updateCounter(params.counter);
  }
}

class UpdateCounterParams {
  final int counter;

  UpdateCounterParams({required this.counter});
}
