import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/reading_progress.dart';

abstract class ReadingProgressRepository {
  Future<RequestResult<Map<String, ReadingProgressEntity>>> getAllProgress();
  Future<RequestResult<void>> saveProgress(ReadingProgressEntity progress);
}
