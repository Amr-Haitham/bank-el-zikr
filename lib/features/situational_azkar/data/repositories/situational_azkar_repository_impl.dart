import 'package:bank_el_ziker/core/utils/safe_await.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/situational_azkar/data/datasources/situational_azkar_local_datasource.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/entities/situational_azkar_favorites.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/repositories/situational_azkar_repository.dart';

class SituationalAzkarRepositoryImpl implements SituationalAzkarRepository {
  final SituationalAzkarLocalDataSource localDataSource;

  SituationalAzkarRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<ZikrEntity>>> getSituationalAzkar() async {
    return safeAwait(() async {
      final models = await localDataSource.getSituationalAzkar();
      return models.map((model) => model.toEntity()).toList();
    });
  }

  @override
  Future<RequestResult<SituationalAzkarFavorites>> getFavorites() async {
    return safeAwait(() async {
      final favoriteIds = await localDataSource.getFavoriteIds();
      return SituationalAzkarFavorites(favoriteIds: favoriteIds);
    });
  }

  @override
  Future<RequestResult<void>> toggleFavorite(int zikrId) async {
    return safeAwait(() async {
      await localDataSource.toggleFavorite(zikrId);
    });
  }
}
