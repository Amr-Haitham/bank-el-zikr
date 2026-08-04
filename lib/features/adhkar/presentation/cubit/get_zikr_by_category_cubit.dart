import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/domain/usecases/get_zikr_by_category.dart';

class GetZikrByCategoryCubit extends RequestCubit<List<ZikrEntity>> {
  final GetZikrByCategory getZikrByCategory;

  GetZikrByCategoryCubit({
    required this.getZikrByCategory,
  }) : super(
          callOnCreate: true,
          request: () =>
              getZikrByCategory(const GetZikrByCategoryParams()),
        );

  /// Re-executes the request scoped to a single [category]. Used by callers
  /// (e.g. the category-scoped adhkar list screen) that need a filtered
  /// subset rather than the full full zikr category set.
  Future<void> loadByCategory(String category) {
    return execute(
      request: () =>
          getZikrByCategory(GetZikrByCategoryParams(category: category)),
    );
  }
}
