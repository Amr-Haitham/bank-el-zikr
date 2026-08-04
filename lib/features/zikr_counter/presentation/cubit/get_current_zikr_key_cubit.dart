import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/get_current_zikr_key.dart';

class GetCurrentZikrKeyCubit extends RequestCubit<String?> {
  final GetCurrentZikrKey getCurrentZikrKey;

  GetCurrentZikrKeyCubit({
    required this.getCurrentZikrKey,
  }) : super(
          callOnCreate: true,
          request: () => getCurrentZikrKey(const NoParams()),
        );
}
