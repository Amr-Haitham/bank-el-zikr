import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:bank_el_ziker/features/home/data/datasources/home_local_datasource.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:bank_el_ziker/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<Prayer>> getRandomPrayer() async {
    try {
      final model = await localDataSource.getRandomPrayer();
      return Right(model.toEntity());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
