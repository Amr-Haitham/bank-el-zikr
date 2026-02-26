import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/repositories/azkar_records_repository.dart';

class DeleteZikrRecord implements UseCase<void, int> {
  final AzkarRecordsRepository repository;

  DeleteZikrRecord(this.repository);

  @override
  Future<RequestResult<void>> call(int zikrId) async {
    return await repository.deleteZikrRecord(zikrId);
  }
}
