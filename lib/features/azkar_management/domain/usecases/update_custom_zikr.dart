import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../entities/zikr.dart';
import '../repositories/azkar_repository.dart';

class UpdateCustomZikr implements UseCase<void, UpdateCustomZikrParams> {
  final AzkarRepository repository;

  UpdateCustomZikr(this.repository);

  @override
  Future<RequestResult<void>> call(UpdateCustomZikrParams params) async {
    return await repository.updateCustomZikr(params.zikr);
  }
}

class UpdateCustomZikrParams {
  final ZikrEntity zikr;

  UpdateCustomZikrParams({required this.zikr});
}
