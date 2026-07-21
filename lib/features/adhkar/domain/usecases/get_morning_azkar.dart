import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/domain/repositories/morning_night_azkar_repository.dart';

class GetMorningAzkar
    implements UseCase<List<ZikrEntity>, NoParams> {
  final MorningNightAzkarRepository repository;

  GetMorningAzkar(this.repository);

  @override
  Future<RequestResult<List<ZikrEntity>>> call(
      NoParams params) async {
    return await repository.getMorningAzkar();
  }
}
