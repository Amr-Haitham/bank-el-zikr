import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/data/datasources/morning_night_azkar_local_datasource.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/repositories/morning_night_azkar_repository.dart';
import 'package:dartz/dartz.dart';

class MorningNightAzkarRepositoryImpl implements MorningNightAzkarRepository {
  final MorningNightAzkarLocalDataSource localDataSource;

  MorningNightAzkarRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<MorningNightZikr>>> getMorningAzkar() async {
    try {
      final models = await localDataSource.getMorningAzkar();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<List<MorningNightZikr>>> getNightAzkar() async {
    try {
      final models = await localDataSource.getNightAzkar();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
