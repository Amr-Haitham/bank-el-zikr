import '../../../../core/constants/type_definitions.dart';
import '../entities/counter_state.dart';

/// Repository interface for zikr counter operations
/// This defines the contract that the data layer must implement
abstract class CounterRepository {
  /// Get the current counter state
  Future<RequestResult<CounterStateEntity>> getCounterState();

  /// Update the counter value
  Future<RequestResult<void>> updateCounter(int counter);

  /// Update the current active zikr
  Future<RequestResult<void>> updateCurrentZikr(int zikrId);

  /// Update the goal for current zikr
  Future<RequestResult<void>> updateGoal(int? goal);

  /// Increment the account balance by 1
  Future<RequestResult<void>> incrementAccountBalance();
}
