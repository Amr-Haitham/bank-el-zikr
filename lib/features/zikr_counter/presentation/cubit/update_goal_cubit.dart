import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/usecases/update_goal.dart';

class UpdateGoalCubit extends RequestCubit<void> {
  final UpdateGoal updateGoal;

  UpdateGoalCubit({
    required this.updateGoal,
  }) : super();

  Future<void> executeUpdate(int? goal) async {
    execute(request: () => updateGoal(UpdateGoalParams(goal: goal)));
  }
}
