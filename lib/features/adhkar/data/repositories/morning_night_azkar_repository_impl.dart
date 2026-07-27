import 'package:bank_el_ziker/core/utils/safe_await.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/adhkar/data/datasources/morning_night_azkar_local_datasource.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/domain/repositories/morning_night_azkar_repository.dart';

class MorningNightAzkarRepositoryImpl implements MorningNightAzkarRepository {
  final MorningNightAzkarLocalDataSource localDataSource;

  MorningNightAzkarRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<ZikrEntity>>> getMorningAzkar() async {
    return safeAwait(() async {
      final models = await localDataSource.getMorningAzkar();
      return models
          .map((model) => model.toEntity(category: 'morning'))
          .toList();
    });
  }

  @override
  Future<RequestResult<List<ZikrEntity>>> getNightAzkar() async {
    return safeAwait(() async {
      final models = await localDataSource.getNightAzkar();
      return models
          .map((model) => model.toEntity(category: 'evening'))
          .toList();
    });
  }
}
