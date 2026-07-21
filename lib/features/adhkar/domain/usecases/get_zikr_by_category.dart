import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/domain/repositories/zikr_category_repository.dart';

class GetZikrByCategoryParams {
  final String? category;

  const GetZikrByCategoryParams({this.category});
}

class GetZikrByCategory
    implements UseCase<List<ZikrEntity>, GetZikrByCategoryParams> {
  final ZikrCategoryRepository repository;

  GetZikrByCategory(this.repository);

  @override
  Future<RequestResult<List<ZikrEntity>>> call(
      GetZikrByCategoryParams params) async {
    return await repository.getZikrByCategory(category: params.category);
  }
}
