import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../repositories/day_record_repository.dart';

class LogZikrIncrement implements UseCase<void, String> {
  final DayRecordRepository repository;

  LogZikrIncrement(this.repository);

  @override
  Future<RequestResult<void>> call(String zikrKey) {
    return repository.logZikrIncrement(zikrKey);
  }
}
