import 'package:hive/hive.dart';
import '../models/zikr_model.dart';

/// Abstract interface for azkar local data source
abstract class AzkarLocalDataSource {
  /// Get all default azkar
  Future<List<ZikrModel>> getDefaultAzkar();

  /// Get all custom azkar
  Future<List<ZikrModel>> getCustomAzkar();

  /// Add a custom zikr
  Future<void> addCustomZikr(ZikrModel zikr);

  /// Update a custom zikr
  Future<void> updateCustomZikr(ZikrModel zikr);

  /// Delete a custom zikr by ID
  Future<void> deleteCustomZikr(int id);
}

/// Implementation using Hive
class AzkarLocalDataSourceImpl implements AzkarLocalDataSource {
  final Box<ZikrModel> defaultAzkarBox;
  final Box<ZikrModel> customAzkarBox;

  AzkarLocalDataSourceImpl({
    required this.defaultAzkarBox,
    required this.customAzkarBox,
  });

  @override
  Future<List<ZikrModel>> getDefaultAzkar() async {
    return defaultAzkarBox.values.toList();
  }

  @override
  Future<List<ZikrModel>> getCustomAzkar() async {
    return customAzkarBox.values.toList();
  }

  @override
  Future<void> addCustomZikr(ZikrModel zikr) async {
    await customAzkarBox.add(zikr);
  }

  @override
  Future<void> updateCustomZikr(ZikrModel zikr) async {
    // Find and update the zikr by ID
    final index = customAzkarBox.values.toList().indexWhere((z) => z.id == zikr.id);
    if (index != -1) {
      await customAzkarBox.putAt(index, zikr);
    } else {
      throw Exception('Custom zikr with id ${zikr.id} not found');
    }
  }

  @override
  Future<void> deleteCustomZikr(int id) async {
    final index = customAzkarBox.values.toList().indexWhere((z) => z.id == id);
    if (index != -1) {
      await customAzkarBox.deleteAt(index);
    } else {
      throw Exception('Custom zikr with id $id not found');
    }
  }
}
