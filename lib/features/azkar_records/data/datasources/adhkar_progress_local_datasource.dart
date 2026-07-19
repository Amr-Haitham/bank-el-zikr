import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AdhkarProgressLocalDataSource {
  Future<Map<String, Map<String, dynamic>>> getAllProgress();
  Future<void> saveProgress({
    required String category,
    required DateTime lastReadAt,
    required int completedCount,
    required int totalCount,
    required Map<int, int> repsByZikrId,
  });
}

class AdhkarProgressLocalDataSourceImpl
    implements AdhkarProgressLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _storageKey = 'adhkar_progress';

  AdhkarProgressLocalDataSourceImpl({required this.sharedPreferences});

  Map<String, Map<String, dynamic>> _readAll() {
    final raw = sharedPreferences.getString(_storageKey);
    if (raw == null) return {};
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return decoded.map(
        (key, value) => MapEntry(key, Map<String, dynamic>.from(value as Map)));
  }

  @override
  Future<Map<String, Map<String, dynamic>>> getAllProgress() async {
    return _readAll();
  }

  @override
  Future<void> saveProgress({
    required String category,
    required DateTime lastReadAt,
    required int completedCount,
    required int totalCount,
    required Map<int, int> repsByZikrId,
  }) async {
    final all = _readAll();
    all[category] = {
      'lastReadAt': lastReadAt.millisecondsSinceEpoch,
      'completedCount': completedCount,
      'totalCount': totalCount,
      'repsByZikrId':
          repsByZikrId.map((zikrId, reps) => MapEntry(zikrId.toString(), reps)),
    };
    await sharedPreferences.setString(_storageKey, jsonEncode(all));
  }
}
