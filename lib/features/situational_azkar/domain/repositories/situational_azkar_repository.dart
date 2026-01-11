import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/entities/situational_azkar_favorites.dart';

abstract class SituationalAzkarRepository {
  Future<RequestResult<List<Zikr>>> getSituationalAzkar();
  Future<RequestResult<SituationalAzkarFavorites>> getFavorites();
  Future<RequestResult<void>> toggleFavorite(int zikrId);
}
