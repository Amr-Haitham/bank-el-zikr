import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';

abstract class ZikrCategoryRepository {
  Future<RequestResult<List<ZikrEntity>>> getZikrByCategory({
    String? category,
  });
}
