import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/repositories/situational_azkar_repository.dart';

class GetSituationalAzkar implements UseCase<List<ZikrEntity>, NoParams> {
  final SituationalAzkarRepository repository;

  GetSituationalAzkar(this.repository);

  @override
  Future<RequestResult<List<ZikrEntity>>> call(NoParams params) async {
    return await repository.getSituationalAzkar();
  }
}
