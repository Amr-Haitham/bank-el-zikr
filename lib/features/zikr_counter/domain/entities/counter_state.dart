import 'package:equatable/equatable.dart';

/// Domain entity representing the current state of the zikr counter
/// This is a pure Dart class with no external dependencies
class CounterStateEntity extends Equatable {
  final int currentZikrId;
  final int currentCounter;
  final int? currentGoal;
  final int accountBalance;

  const CounterStateEntity({
    required this.currentZikrId,
    required this.currentCounter,
    this.currentGoal,
    required this.accountBalance,
  });

  /// Creates a copy with updated fields
  CounterStateEntity copyWith({
    int? currentZikrId,
    int? currentCounter,
    int? currentGoal,
    int? accountBalance,
  }) {
    return CounterStateEntity(
      currentZikrId: currentZikrId ?? this.currentZikrId,
      currentCounter: currentCounter ?? this.currentCounter,
      currentGoal: currentGoal ?? this.currentGoal,
      accountBalance: accountBalance ?? this.accountBalance,
    );
  }

  @override
  List<Object?> get props => [
        currentZikrId,
        currentCounter,
        currentGoal,
        accountBalance,
      ];
}
