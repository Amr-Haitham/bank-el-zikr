import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/core/constants/general_functions.dart';
import '../../domain/repositories/azkar_repository.dart';
import '../datasources/azkar_local_datasource.dart';
import 'package:bank_el_ziker/core/data/models/zikr_mapper.dart';

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
      return allAzkar.map((model) => ZikrMapper.toEntity(model)).toList();
    });
  }

  @override
  Future<RequestResult<void>> addCustomZikr(ZikrEntity zikr) async {
    return safeAwait(() async {
      // Custom azkar are always submitted with id: 0 by the caller — assign
      // a real unique id here, otherwise every custom zikr would be stored
      // under the same Hive key and overwrite the previous one. Hive integer
      // keys must fit in 0-0xFFFFFFFF, so the raw epoch timestamp (which
      // overflows that range) is folded down with modulo.
      final model = ZikrMapper.toModel(
        zikr.copyWith(
          id: DateTime.now().microsecondsSinceEpoch % 0xFFFFFFFF,
          key: generateCustomZikrKey(),
        ),
      );
      await localDataSource.addCustomZikr(model);
    });
  }

  @override
  Future<RequestResult<void>> updateCustomZikr(ZikrEntity zikr) async {
    return safeAwait(() async {
      final model = ZikrMapper.toModel(zikr);
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
