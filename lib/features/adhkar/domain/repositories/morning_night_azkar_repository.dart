import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';

abstract class MorningNightAzkarRepository {
  Future<RequestResult<List<ZikrEntity>>> getMorningAzkar();
  Future<RequestResult<List<ZikrEntity>>> getNightAzkar();
}
