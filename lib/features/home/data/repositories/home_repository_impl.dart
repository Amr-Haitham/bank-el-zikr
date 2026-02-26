import 'package:bank_el_ziker/core/utils/safe_await.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/home/data/datasources/home_local_datasource.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:bank_el_ziker/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<PrayerEntity>> getRandomPrayer() async {
    return safeAwait(() async {
      final model = await localDataSource.getRandomPrayer();
      return model.toEntity();
    });
  }
}
