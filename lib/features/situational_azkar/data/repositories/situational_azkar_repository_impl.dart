import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/situational_azkar/data/datasources/situational_azkar_local_datasource.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/entities/situational_azkar_favorites.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/repositories/situational_azkar_repository.dart';
import 'package:dartz/dartz.dart';

class SituationalAzkarRepositoryImpl implements SituationalAzkarRepository {
  final SituationalAzkarLocalDataSource localDataSource;

  SituationalAzkarRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<Zikr>>> getSituationalAzkar() async {
    try {
      final models = await localDataSource.getSituationalAzkar();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<SituationalAzkarFavorites>> getFavorites() async {
    try {
      final favoriteIds = await localDataSource.getFavoriteIds();
      return Right(SituationalAzkarFavorites(favoriteIds: favoriteIds));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> toggleFavorite(int zikrId) async {
    try {
      await localDataSource.toggleFavorite(zikrId);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
