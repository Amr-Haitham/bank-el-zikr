import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/increment_balance.dart';

class IncrementBalanceCubit extends RequestCubit<void> {
  final IncrementBalance incrementBalance;

  IncrementBalanceCubit({
    required this.incrementBalance,
  }) : super();

  Future<void> executeIncrement() async {
    execute(request: () => incrementBalance(const NoParams()));
  }
}
