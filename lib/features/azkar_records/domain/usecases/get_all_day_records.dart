import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/day_record.dart';
import '../repositories/day_record_repository.dart';

class GetAllDayRecords implements UseCase<List<DayRecordEntity>, NoParams> {
  final DayRecordRepository repository;

  GetAllDayRecords(this.repository);

  @override
  Future<RequestResult<List<DayRecordEntity>>> call(NoParams params) {
    return repository.getAll();
  }
}
