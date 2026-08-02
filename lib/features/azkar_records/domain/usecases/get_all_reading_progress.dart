import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/reading_progress.dart';
import '../repositories/reading_progress_repository.dart';

class GetAllReadingProgress
    implements UseCase<Map<String, ReadingProgressEntity>, NoParams> {
  final ReadingProgressRepository repository;

  GetAllReadingProgress(this.repository);

  @override
  Future<RequestResult<Map<String, ReadingProgressEntity>>> call(
      NoParams params) {
    return repository.getAllProgress();
  }
}
