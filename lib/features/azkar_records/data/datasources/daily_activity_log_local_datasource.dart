import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class DailyActivityLogLocalDataSource {
  /// Returns a map of date-key ("yyyy-MM-dd") -> raw day data.
  Future<Map<String, Map<String, dynamic>>> getAll();

  Future<void> logZikrIncrement({required int zikrId, required DateTime date});

  /// category is "morning" or "evening".
  Future<void> markAdhkarCompleted({
    required String category,
    required DateTime date,
  });
}

class DailyActivityLogLocalDataSourceImpl
    implements DailyActivityLogLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _storageKey = 'daily_activity_log';

  DailyActivityLogLocalDataSourceImpl({required this.sharedPreferences});

  static String _dateKey(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    return "${d.year.toString().padLeft(4, '0')}-"
        "${d.month.toString().padLeft(2, '0')}-"
        "${d.day.toString().padLeft(2, '0')}";
  }

  Map<String, Map<String, dynamic>> _readAll() {
    final raw = sharedPreferences.getString(_storageKey);
    if (raw == null) return {};
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return decoded.map(
        (key, value) => MapEntry(key, Map<String, dynamic>.from(value as Map)));
  }

  Future<void> _writeAll(Map<String, Map<String, dynamic>> all) async {
    await sharedPreferences.setString(_storageKey, jsonEncode(all));
  }

  @override
  Future<Map<String, Map<String, dynamic>>> getAll() async {
    return _readAll();
  }

  @override
  Future<void> logZikrIncrement({
    required int zikrId,
    required DateTime date,
  }) async {
    final all = _readAll();
    final key = _dateKey(date);
    final day = all[key] ?? {};
    final zikrCounts = Map<String, dynamic>.from(day['zikrCounts'] ?? {});
    final current = (zikrCounts[zikrId.toString()] as int?) ?? 0;
    zikrCounts[zikrId.toString()] = current + 1;
    day['zikrCounts'] = zikrCounts;
    all[key] = day;
    await _writeAll(all);
  }

  @override
  Future<void> markAdhkarCompleted({
    required String category,
    required DateTime date,
  }) async {
    final all = _readAll();
    final key = _dateKey(date);
    final day = all[key] ?? {};
    day['${category}Completed'] = true;
    all[key] = day;
    await _writeAll(all);
  }
}
