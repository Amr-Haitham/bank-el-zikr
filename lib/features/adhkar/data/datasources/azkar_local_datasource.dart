import 'package:hive/hive.dart';
import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';

/// Abstract interface for azkar local data source
abstract class AzkarLocalDataSource {
  /// Get default azkar from local storage
  Future<List<Zikr>> getDefaultAzkar();

  /// Get custom azkar from local storage
  Future<List<Zikr>> getCustomAzkar();

  /// Add a custom zikr to local storage
  Future<void> addCustomZikr(Zikr zikr);

  /// Update a custom zikr in local storage
  Future<void> updateCustomZikr(Zikr zikr);

  /// Delete a custom zikr from local storage
  Future<void> deleteCustomZikr(int id);
}

/// Implementation of AzkarLocalDataSource using Hive
class AzkarLocalDataSourceImpl implements AzkarLocalDataSource {
  final Box<Zikr> defaultAzkarBox;
  final Box<Zikr> customAzkarBox;

  AzkarLocalDataSourceImpl({
    required this.defaultAzkarBox,
    required this.customAzkarBox,
  });

  @override
  Future<List<Zikr>> getDefaultAzkar() async {
    return defaultAzkarBox.values.toList();
  }

  @override
  Future<List<Zikr>> getCustomAzkar() async {
    return customAzkarBox.values.toList();
  }

  @override
  Future<void> addCustomZikr(Zikr zikr) async {
    // For custom azkar, we use the id as the key
    await customAzkarBox.put(zikr.id, zikr);
  }

  @override
  Future<void> updateCustomZikr(Zikr zikr) async {
    await customAzkarBox.put(zikr.id, zikr);
  }

  @override
  Future<void> deleteCustomZikr(int id) async {
    await customAzkarBox.delete(id);
  }
}
