import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/usecases/usecase.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/repositories/morning_night_azkar_repository.dart';

class GetMorningAzkar implements UseCase<List<MorningNightZikr>, NoParams> {
  final MorningNightAzkarRepository repository;

  GetMorningAzkar(this.repository);

  @override
  Future<RequestResult<List<MorningNightZikr>>> call(NoParams params) async {
    return await repository.getMorningAzkar();
  }
}
