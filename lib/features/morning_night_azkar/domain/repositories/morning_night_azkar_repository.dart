import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';

abstract class MorningNightAzkarRepository {
  Future<RequestResult<List<MorningNightZikr>>> getMorningAzkar();
  Future<RequestResult<List<MorningNightZikr>>> getNightAzkar();
}
