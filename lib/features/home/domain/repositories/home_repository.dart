import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';

abstract class HomeRepository {
  Future<RequestResult<Prayer>> getRandomPrayer();
}
