import 'package:bank_el_ziker/core/utils/safe_await.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/core/data/models/zikr_mapper.dart';
import 'package:bank_el_ziker/features/adhkar/data/datasources/zikr_category_local_datasource.dart';
import 'package:bank_el_ziker/features/adhkar/domain/repositories/zikr_category_repository.dart';

class ZikrCategoryRepositoryImpl implements ZikrCategoryRepository {
  final ZikrCategoryLocalDataSource localDataSource;

  ZikrCategoryRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<List<ZikrEntity>>> getZikrByCategory({
    String? category,
  }) async {
    return safeAwait(() async {
      final models =
          await localDataSource.getZikrByCategory(category: category);
      return models.map((model) => ZikrMapper.toEntity(model)).toList();
    });
  }
}
