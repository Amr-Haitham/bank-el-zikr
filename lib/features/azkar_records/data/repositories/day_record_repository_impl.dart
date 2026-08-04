import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../domain/entities/day_record.dart';
import '../../domain/repositories/day_record_repository.dart';
import '../datasources/day_record_local_datasource.dart';
import '../models/day_record_mapper.dart';

class DayRecordRepositoryImpl implements DayRecordRepository {
  final DayRecordLocalDataSource localDataSource;

  DayRecordRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<DayRecordEntity>>> getAll() async {
    return safeAwait(() async {
      final models = await localDataSource.getAll();
      return models.map((model) => DayRecordMapper.toEntity(model)).toList();
    });
  }

  @override
  Future<RequestResult<void>> logZikrIncrement(String zikrKey) async {
    return safeAwait(() async {
      await localDataSource.logZikrIncrement(
          zikrKey: zikrKey, date: DateTime.now());
    });
  }

  @override
  Future<RequestResult<void>> markCategoryCompleted(String category) async {
    return safeAwait(() async {
      await localDataSource.markCategoryCompleted(
          category: category, date: DateTime.now());
    });
  }

  @override
  Future<RequestResult<void>> deleteZikrRecord(String zikrKey) async {
    return safeAwait(() async {
      await localDataSource.deleteZikrRecord(zikrKey);
    });
  }
}
