import 'package:dartz/dartz.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/data/failure/failure.dart';
import '../../domain/entities/day_zikr_record.dart';
import '../../domain/repositories/azkar_records_repository.dart';
import '../datasources/azkar_records_local_datasource.dart';
import '../models/day_zikr_record_model.dart';

/// Implementation of AzkarRecordsRepository
/// Handles data operations and error handling using RequestResult pattern
class AzkarRecordsRepositoryImpl implements AzkarRecordsRepository {
  final AzkarRecordsLocalDataSource localDataSource;

  AzkarRecordsRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<DayZikrRecord>>> getAllRecords() async {
    try {
      final recordModels = await localDataSource.getAllRecords();
      final entities = recordModels.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e) {
      return Left(Failure(
        message: 'Failed to get azkar records: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> updateAllRecords(List<DayZikrRecord> records) async {
    try {
      final recordModels = records
          .map((entity) => DayZikrRecordModel.fromEntity(entity))
          .toList();
      await localDataSource.updateAllRecords(recordModels);
      return const Right(null);
    } catch (e) {
      return Left(Failure(
        message: 'Failed to update azkar records: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> incrementZikrRecord(int zikrId) async {
    try {
      await localDataSource.incrementZikrRecord(zikrId);
      return const Right(null);
    } catch (e) {
      return Left(Failure(
        message: 'Failed to increment zikr record: ${e.toString()}',
      ));
    }
  }
}
