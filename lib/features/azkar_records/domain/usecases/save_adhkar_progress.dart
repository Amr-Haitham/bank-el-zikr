import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/adhkar_progress.dart';
import '../repositories/adhkar_progress_repository.dart';

class SaveAdhkarProgress implements UseCase<void, AdhkarProgressEntity> {
  final AdhkarProgressRepository repository;

  SaveAdhkarProgress(this.repository);

  @override
  Future<RequestResult<void>> call(AdhkarProgressEntity params) {
    return repository.saveProgress(params);
  }
}
