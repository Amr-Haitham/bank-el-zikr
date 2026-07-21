import 'package:bank_el_ziker/core/utils/safe_await.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/data/datasources/zikr_category_local_datasource.dart';
import 'package:bank_el_ziker/features/adhkar/domain/repositories/zikr_category_repository.dart';
import 'package:bank_el_ziker/features/adhkar/data/datasources/morning_night_azkar_local_datasource.dart';

/// The one repository every category's reading screen goes through. Morning
/// and evening azkar live in their own Hive boxes (a different Hive model
/// entirely), while every other category shares one box filtered by
/// [ZikrEntity.category] — this class hides that split behind a single
/// [getZikrByCategory] call so callers never need to know which box a
/// category's data actually lives in.
class ZikrCategoryRepositoryImpl implements ZikrCategoryRepository {
  final ZikrCategoryLocalDataSource localDataSource;
  final MorningNightAzkarLocalDataSource morningNightDataSource;

  ZikrCategoryRepositoryImpl({
    required this.localDataSource,
    required this.morningNightDataSource,
  });

  @override
  Future<RequestResult<List<ZikrEntity>>> getZikrByCategory({
    String? category,
  }) async {
    return safeAwait(() async {
      if (category == 'morning') {
        final models = await morningNightDataSource.getMorningAzkar();
        return models
            .map((model) => model.toEntity(category: 'morning'))
            .toList();
      }
      if (category == 'evening') {
        final models = await morningNightDataSource.getNightAzkar();
        return models
            .map((model) => model.toEntity(category: 'evening'))
            .toList();
      }
      final models =
          await localDataSource.getZikrByCategory(category: category);
      return models.map((model) => model.toEntity()).toList();
    });
  }
}
