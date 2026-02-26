import 'package:hive/hive.dart';

/// A wrapper class for Hive to handle caching operations.
class CacheClient {
  static const String _defaultBoxName = 'app_cache';
  late Box _box;

  /// Initialize the cache client
  /// [boxName] - Optional name for the Hive box
  Future<void> init({String boxName = _defaultBoxName}) async {
    _box = await Hive.openBox(boxName);
  }

  /// Store a value in the cache
  /// [key] - The key to store the value under
  /// [value] - The value to store
  /// [expiryDuration] - Optional duration after which the value should expire
  Future<void> put(String key, dynamic value, {Duration? expiryDuration}) async {
    if (expiryDuration != null) {
      final expiryTime = DateTime.now().add(expiryDuration);
      await _box.put(key, {
        'value': value,
        'expiryTime': expiryTime.millisecondsSinceEpoch,
      });
    } else {
      await _box.put(key, {'value': value});
    }
  }

  /// Retrieve a value from the cache
  /// [key] - The key to retrieve the value for
  /// Returns null if the key doesn't exist or the value has expired
  T? get<T>(String key) {
    final data = _box.get(key);
    if (data == null) return null;

    final expiryTime = data['expiryTime'];
    if (expiryTime != null) {
      final expired = DateTime.fromMillisecondsSinceEpoch(expiryTime).isBefore(DateTime.now());
      if (expired) {
        _box.delete(key);
        return null;
      }
    }

    return data['value'] as T?;
  }

  /// Remove a value from the cache
  /// [key] - The key to remove
  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  /// Clear all values from the cache
  Future<void> clear() async {
    await _box.clear();
  }

  /// Check if a key exists in the cache
  /// [key] - The key to check
  bool containsKey(String key) {
    return _box.containsKey(key);
  }

  /// Get all keys in the cache
  List<String> getAllKeys() {
    return _box.keys.cast<String>().toList();
  }

  /// Close the cache box
  Future<void> close() async {
    await _box.close();
  }
}
