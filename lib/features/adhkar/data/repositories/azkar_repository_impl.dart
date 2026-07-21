import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../domain/entities/zikr.dart';
import '../../domain/repositories/azkar_repository.dart';
import '../datasources/azkar_local_datasource.dart';
import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';

class AzkarRepositoryImpl implements AzkarRepository {
  final AzkarLocalDataSource localDataSource;

  AzkarRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<ZikrEntity>>> getAllAzkar() async {
    return safeAwait(() async {
      // Get both default and custom azkar
      final defaultAzkar = await localDataSource.getDefaultAzkar();
      final customAzkar = await localDataSource.getCustomAzkar();

      // Combine and convert to entities
      final allAzkar = [...defaultAzkar, ...customAzkar];
      return allAzkar.map((model) => model.toEntity()).toList();
    });
  }

  @override
  Future<RequestResult<void>> addCustomZikr(ZikrEntity zikr) async {
    return safeAwait(() async {
      final model = Zikr.fromEntity(zikr);
      await localDataSource.addCustomZikr(model);
    });
  }

  @override
  Future<RequestResult<void>> updateCustomZikr(ZikrEntity zikr) async {
    return safeAwait(() async {
      final model = Zikr.fromEntity(zikr);
      await localDataSource.updateCustomZikr(model);
    });
  }

  @override
  Future<RequestResult<void>> deleteCustomZikr(int id) async {
    return safeAwait(() async {
      await localDataSource.deleteCustomZikr(id);
    });
  }
}
