import 'package:hive/hive.dart';
import 'package:bank_el_ziker/features/zikr_counter/data/models/general_data_model.dart';

/// Abstract interface for counter local data source
abstract class CounterLocalDataSource {
  /// Get the counter state from local storage
  Future<GeneralData> getCounterState();

  /// Update the counter state in local storage
  Future<void> updateCounterState(GeneralData counterState);
}

/// Implementation of CounterLocalDataSource using Hive
class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  final Box<GeneralData> box;

  CounterLocalDataSourceImpl({required this.box});

  @override
  Future<GeneralData> getCounterState() async {
    // The box should have the data stored with key "generalData"
    // matching the old implementation
    final counterState = box.get('generalData');
    if (counterState == null) {
      throw Exception('Counter state not found in storage');
    }
    return counterState;
  }

  @override
  Future<void> updateCounterState(GeneralData counterState) async {
    await box.put('generalData', counterState);
  }
}
