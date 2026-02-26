import 'package:bank_el_ziker/core/utils/safe_await.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/data/datasources/morning_night_azkar_local_datasource.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/repositories/morning_night_azkar_repository.dart';

class MorningNightAzkarRepositoryImpl implements MorningNightAzkarRepository {
  final MorningNightAzkarLocalDataSource localDataSource;

  MorningNightAzkarRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<MorningNightZikrEntity>>> getMorningAzkar() async {
    return safeAwait(() async {
      final models = await localDataSource.getMorningAzkar();
      return models.map((model) => model.toEntity()).toList();
    });
  }

  @override
  Future<RequestResult<List<MorningNightZikrEntity>>> getNightAzkar() async {
    return safeAwait(() async {
      final models = await localDataSource.getNightAzkar();
      return models.map((model) => model.toEntity()).toList();
    });
  }
}
