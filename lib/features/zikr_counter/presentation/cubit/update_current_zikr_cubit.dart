import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/update_current_zikr.dart';

class UpdateCurrentZikrCubit extends RequestCubit<void> {
  final UpdateCurrentZikr updateCurrentZikr;

  UpdateCurrentZikrCubit({
    required this.updateCurrentZikr,
  }) : super();

  Future<void> executeUpdate(int zikrId) async {
    execute(
        request: () =>
            updateCurrentZikr(UpdateCurrentZikrParams(zikrId: zikrId)));
  }
}
