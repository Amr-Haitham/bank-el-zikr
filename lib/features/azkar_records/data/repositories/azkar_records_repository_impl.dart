import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../domain/entities/day_zikr_record.dart';
import '../../domain/repositories/azkar_records_repository.dart';
import '../datasources/azkar_records_local_datasource.dart';
import 'package:bank_el_ziker/features/azkar_records/data/models/day_zikr_record_model.dart';

/// Implementation of AzkarRecordsRepository
/// Handles data operations and error handling using safeAwait
class AzkarRecordsRepositoryImpl implements AzkarRecordsRepository {
  final AzkarRecordsLocalDataSource localDataSource;

  AzkarRecordsRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<DayZikrRecordEntity>>> getAllRecords() async {
    return safeAwait(() async {
      final recordModels = await localDataSource.getAllRecords();
      return recordModels.map((model) => model.toEntity()).toList();
    });
  }

  @override
  Future<RequestResult<void>> updateAllRecords(
      List<DayZikrRecordEntity> records) async {
    return safeAwait(() async {
      final recordModels =
          records.map((entity) => DayZikrRecord.fromEntity(entity)).toList();
      await localDataSource.updateAllRecords(recordModels);
    });
  }

  @override
  Future<RequestResult<void>> incrementZikrRecord(int zikrId) async {
    return safeAwait(() async {
      await localDataSource.incrementZikrRecord(zikrId);
    });
  }

  @override
  Future<RequestResult<void>> deleteZikrRecord(int zikrId) async {
    return safeAwait(() async {
      await localDataSource.deleteZikrRecord(zikrId);
    });
  }
}
