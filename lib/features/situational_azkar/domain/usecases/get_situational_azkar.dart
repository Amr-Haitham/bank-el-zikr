import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/repositories/situational_azkar_repository.dart';

class GetSituationalAzkar implements UseCase<List<Zikr>, NoParams> {
  final SituationalAzkarRepository repository;

  GetSituationalAzkar(this.repository);

  @override
  Future<RequestResult<List<Zikr>>> call(NoParams params) async {
    return await repository.getSituationalAzkar();
  }
}
