import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/update_counter.dart';

class UpdateCounterCubit extends RequestCubit<void> {
  final UpdateCounter updateCounter;

  UpdateCounterCubit({
    required this.updateCounter,
  }) : super();

  Future<void> executeUpdate(int counter) async {
    execute(
        request: () => updateCounter(UpdateCounterParams(counter: counter)));
  }
}
