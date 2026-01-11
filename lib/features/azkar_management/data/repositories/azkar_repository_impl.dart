import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/data/failure/failure.dart';
import '../../domain/entities/zikr.dart';
import '../../domain/repositories/azkar_repository.dart';
import '../datasources/azkar_local_datasource.dart';
import '../models/zikr_model.dart';

class AzkarRepositoryImpl implements AzkarRepository {
  final AzkarLocalDataSource localDataSource;

  AzkarRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<Zikr>>> getAllAzkar() async {
    try {
      // Get both default and custom azkar
      final defaultAzkar = await localDataSource.getDefaultAzkar();
      final customAzkar = await localDataSource.getCustomAzkar();

      // Combine and convert to entities
      final allAzkar = [...defaultAzkar, ...customAzkar];
      final entities = allAzkar.map((model) => model.toEntity()).toList();

      return Right(entities);
    } catch (e) {
      return Left(Failure(
        exception: e,
        message: 'Failed to get azkar: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> addCustomZikr(Zikr zikr) async {
    try {
      final model = ZikrModel.fromEntity(zikr);
      await localDataSource.addCustomZikr(model);
      return const Right(null);
    } catch (e) {
      return Left(Failure(
        exception: e,
        message: 'Failed to add custom zikr: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> updateCustomZikr(Zikr zikr) async {
    try {
      final model = ZikrModel.fromEntity(zikr);
      await localDataSource.updateCustomZikr(model);
      return const Right(null);
    } catch (e) {
      return Left(Failure(
        exception: e,
        message: 'Failed to update custom zikr: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> deleteCustomZikr(int id) async {
    try {
      await localDataSource.deleteCustomZikr(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(
        exception: e,
        message: 'Failed to delete custom zikr: ${e.toString()}',
      ));
    }
  }
}
