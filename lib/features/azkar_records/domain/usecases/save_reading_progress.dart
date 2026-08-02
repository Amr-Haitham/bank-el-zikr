import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/reading_progress.dart';
import '../repositories/reading_progress_repository.dart';

class SaveReadingProgress implements UseCase<void, ReadingProgressEntity> {
  final ReadingProgressRepository repository;

  SaveReadingProgress(this.repository);

  @override
  Future<RequestResult<void>> call(ReadingProgressEntity params) {
    return repository.saveProgress(params);
  }
}
