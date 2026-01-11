import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../entities/zikr.dart';
import '../repositories/azkar_repository.dart';

class AddCustomZikr implements UseCase<void, AddCustomZikrParams> {
  final AzkarRepository repository;

  AddCustomZikr(this.repository);

  @override
  Future<RequestResult<void>> call(AddCustomZikrParams params) async {
    return await repository.addCustomZikr(params.zikr);
  }
}

class AddCustomZikrParams {
  final ZikrEntity zikr;

  AddCustomZikrParams({required this.zikr});
}
