import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/get_counter_state.dart';

class GetCounterStateCubit extends RequestCubit<CounterStateEntity> {
  final GetCounterState getCounterState;

  GetCounterStateCubit({
    required this.getCounterState,
  }) : super(
          callOnCreate: true,
          request: () => getCounterState(const NoParams()),
        );
}
