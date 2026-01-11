import 'package:hive/hive.dart';
import '../models/counter_state_model.dart';

/// Abstract interface for counter local data source
abstract class CounterLocalDataSource {
  /// Get the counter state from local storage
  Future<CounterStateModel> getCounterState();

  /// Update the counter state in local storage
  Future<void> updateCounterState(CounterStateModel counterState);
}

/// Implementation of CounterLocalDataSource using Hive
class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  final Box<CounterStateModel> box;

  CounterLocalDataSourceImpl({required this.box});

  @override
  Future<CounterStateModel> getCounterState() async {
    // The box should have the data stored with key "generalData"
    // matching the old implementation
    final counterState = box.get('generalData');
    if (counterState == null) {
      throw Exception('Counter state not found in storage');
    }
    return counterState;
  }

  @override
  Future<void> updateCounterState(CounterStateModel counterState) async {
    await box.put('generalData', counterState);
  }
}
