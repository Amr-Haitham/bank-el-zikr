import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/domain/usecases/get_zikr_by_category.dart';

class ZikrCategoryCubit extends RequestCubit<List<ZikrEntity>> {
  final GetZikrByCategory getZikrByCategory;

  ZikrCategoryCubit({required this.getZikrByCategory})
      : super(callOnCreate: false);

  Future<void> load(String category) {
    return execute(
      request: () =>
          getZikrByCategory(GetZikrByCategoryParams(category: category)),
    );
  }
}
