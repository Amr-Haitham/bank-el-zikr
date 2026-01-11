import '../../../../core/constants/type_definitions.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/counter_repository.dart';

/// Use case for updating the current active zikr
class UpdateCurrentZikr implements UseCase<void, UpdateCurrentZikrParams> {
  final CounterRepository repository;

  UpdateCurrentZikr(this.repository);

  @override
  Future<RequestResult<void>> call(UpdateCurrentZikrParams params) async {
    return await repository.updateCurrentZikr(params.zikrId);
  }
}

class UpdateCurrentZikrParams {
  final int zikrId;

  UpdateCurrentZikrParams({required this.zikrId});
}
