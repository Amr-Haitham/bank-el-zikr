import '../../../../core/presentation/request_cubit/request_cubit.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/counter_state.dart';
import '../../domain/usecases/get_counter_state.dart';
import '../../domain/usecases/get_current_zikr_id.dart';
import '../../domain/usecases/increment_balance.dart';
import '../../domain/usecases/update_counter.dart';
import '../../domain/usecases/update_current_zikr.dart';
import '../../domain/usecases/update_goal.dart';

/// Cubit for managing zikr counter state using RequestCubit pattern with Freezed
/// Replaces the old GetGeneralDataCubit, UpdateGeneralDataCubit, and GetCurrentZikrCubit
class CounterCubit extends RequestCubit<CounterState> {
  final GetCounterState getCounterState;
  final GetCurrentZikrId getCurrentZikrId;
  final UpdateCounter updateCounter;
  final UpdateCurrentZikr updateCurrentZikr;
  final UpdateGoal updateGoal;
  final IncrementBalance incrementBalance;

  CounterCubit({
    required this.getCounterState,
    required this.getCurrentZikrId,
    required this.updateCounter,
    required this.updateCurrentZikr,
    required this.updateGoal,
    required this.incrementBalance,
  }) : super(
          callOnCreate: true,
          request: () => getCounterState(const NoParams()),
        );

  /// Load the counter state (can also call execute() directly)
  Future<void> loadCounterState() async {
    await execute(request: () => getCounterState(const NoParams()));
  }

  /// Get just the current zikr ID (convenience method)
  Future<int?> getCurrentZikr() async {
    final result = await getCurrentZikrId(const NoParams());
    return result.fold(
      (failure) => null,
      (zikrId) => zikrId,
    );
  }

  /// Update the counter value and reload state
  Future<void> setCounter(int counter) async {
    final result = await updateCounter(UpdateCounterParams(counter: counter));

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful update
    );
  }

  /// Update the current active zikr and reload state
  Future<void> setCurrentZikr(int zikrId) async {
    final result = await updateCurrentZikr(UpdateCurrentZikrParams(zikrId: zikrId));

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful update
    );
  }

  /// Update the goal and reload state
  Future<void> setGoal(int? goal) async {
    final result = await updateGoal(UpdateGoalParams(goal: goal));

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful update
    );
  }

  /// Increment the account balance and reload state
  Future<void> addToBalance() async {
    final result = await incrementBalance(const NoParams());

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful update
    );
  }
}
