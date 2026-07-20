import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import '../entities/adhkar_progress.dart';

abstract class AdhkarProgressRepository {
  Future<RequestResult<Map<String, AdhkarProgressEntity>>> getAllProgress();
  Future<RequestResult<void>> saveProgress(AdhkarProgressEntity progress);
}
