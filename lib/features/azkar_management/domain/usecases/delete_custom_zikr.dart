import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../repositories/azkar_repository.dart';

class DeleteCustomZikr implements UseCase<void, DeleteCustomZikrParams> {
  final AzkarRepository repository;

  DeleteCustomZikr(this.repository);

  @override
  Future<RequestResult<void>> call(DeleteCustomZikrParams params) async {
    return await repository.deleteCustomZikr(params.id);
  }
}

class DeleteCustomZikrParams {
  final int id;

  DeleteCustomZikrParams({required this.id});
}
