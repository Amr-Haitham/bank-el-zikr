import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../repositories/counter_repository.dart';

/// Use case for updating the goal for current zikr
class UpdateGoal implements UseCase<void, UpdateGoalParams> {
  final CounterRepository repository;

  UpdateGoal(this.repository);

  @override
  Future<RequestResult<void>> call(UpdateGoalParams params) async {
    return await repository.updateGoal(params.goal);
  }
}

class UpdateGoalParams {
  final int? goal;

  UpdateGoalParams({this.goal});
}
