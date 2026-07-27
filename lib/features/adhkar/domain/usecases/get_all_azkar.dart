import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../entities/zikr.dart';
import '../repositories/azkar_repository.dart';

/// Use case for getting all azkar (default + custom)
class GetAllAzkar implements UseCase<List<ZikrEntity>, NoParams> {
  final AzkarRepository repository;

  GetAllAzkar(this.repository);

  @override
  Future<RequestResult<List<ZikrEntity>>> call(NoParams params) async {
    return await repository.getAllAzkar();
  }
}
