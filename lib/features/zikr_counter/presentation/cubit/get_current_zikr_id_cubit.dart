import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/get_current_zikr_id.dart';

class GetCurrentZikrIdCubit extends RequestCubit<int?> {
  final GetCurrentZikrId getCurrentZikrId;

  GetCurrentZikrIdCubit({
    required this.getCurrentZikrId,
  }) : super(
          callOnCreate: true,
          request: () => getCurrentZikrId(const NoParams()),
        );
}
