import 'package:equatable/equatable.dart';

/// Domain entity representing the current state of the zikr counter
/// This is a pure Dart class with no external dependencies
class CounterStateEntity extends Equatable {
  final String currentZikrKey;
  final int currentCounter;
  final int? currentGoal;
  final int accountBalance;

  const CounterStateEntity({
    required this.currentZikrKey,
    required this.currentCounter,
    this.currentGoal,
    required this.accountBalance,
  });

  /// Creates a copy with updated fields
  CounterStateEntity copyWith({
    String? currentZikrKey,
    int? currentCounter,
    int? currentGoal,
    int? accountBalance,
  }) {
    return CounterStateEntity(
      currentZikrKey: currentZikrKey ?? this.currentZikrKey,
      currentCounter: currentCounter ?? this.currentCounter,
      currentGoal: currentGoal ?? this.currentGoal,
      accountBalance: accountBalance ?? this.accountBalance,
    );
  }

  @override
  List<Object?> get props => [
        currentZikrKey,
        currentCounter,
        currentGoal,
        accountBalance,
      ];
}
