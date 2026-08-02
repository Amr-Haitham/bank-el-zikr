import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/repositories/day_record_repository.dart';

class DeleteZikrRecord implements UseCase<void, String> {
  final DayRecordRepository repository;

  DeleteZikrRecord(this.repository);

  @override
  Future<RequestResult<void>> call(String zikrKey) async {
    return await repository.deleteZikrRecord(zikrKey);
  }
}
