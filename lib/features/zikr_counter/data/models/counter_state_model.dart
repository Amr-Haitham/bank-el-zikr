import 'package:hive/hive.dart';
import '../../domain/entities/counter_state.dart';

part 'counter_state_model.g.dart';

/// Data model for CounterState with Hive persistence
/// Uses composition instead of inheritance to avoid field override issues
@HiveType(typeId: 2)
class CounterStateModel extends HiveObject {
  @HiveField(0)
  int currentZikrId;

  @HiveField(1)
  int currentCounter;

  @HiveField(2)
  int? currentGoal;

  @HiveField(3)
  int accountBalance;

  CounterStateModel({
    required this.currentZikrId,
    required this.currentCounter,
    this.currentGoal,
    required this.accountBalance,
  });

  /// Convert model to domain entity
  CounterState toEntity() {
    return CounterState(
      currentZikrId: currentZikrId,
      currentCounter: currentCounter,
      currentGoal: currentGoal,
      accountBalance: accountBalance,
    );
  }

  /// Create model from domain entity
  factory CounterStateModel.fromEntity(CounterState entity) {
    return CounterStateModel(
      currentZikrId: entity.currentZikrId,
      currentCounter: entity.currentCounter,
      currentGoal: entity.currentGoal,
      accountBalance: entity.accountBalance,
    );
  }
}
