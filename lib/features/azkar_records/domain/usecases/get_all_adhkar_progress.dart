import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/adhkar_progress.dart';
import '../repositories/adhkar_progress_repository.dart';

class GetAllAdhkarProgress
    implements UseCase<Map<String, AdhkarProgressEntity>, NoParams> {
  final AdhkarProgressRepository repository;

  GetAllAdhkarProgress(this.repository);

  @override
  Future<RequestResult<Map<String, AdhkarProgressEntity>>> call(
      NoParams params) {
    return repository.getAllProgress();
  }
}
