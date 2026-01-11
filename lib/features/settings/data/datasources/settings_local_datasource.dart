import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  Future<bool> getIsLightTheme();
  Future<bool> getIsVibrating();
  Future<TimeOfDay?> getMorningZikrAlarm();
  Future<TimeOfDay?> getNightZikrAlarm();
  Future<void> setLightTheme(bool value);
  Future<void> setIsVibrating(bool value);
  Future<void> setMorningZikrAlarm(TimeOfDay time);
  Future<void> setNightZikrAlarm(TimeOfDay time);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _isLightThemeKey = 'isLightTheme';
  static const String _morningZikrAlarmKey = 'morningZikrAlarm';
  static const String _nightZikrAlarmKey = 'nightZikrAlarm';
  static const String _isVibratingKey = 'isVibrating';

  SettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getIsLightTheme() async {
    return sharedPreferences.getBool(_isLightThemeKey) ?? true;
  }

  @override
  Future<bool> getIsVibrating() async {
    return sharedPreferences.getBool(_isVibratingKey) ?? true;
  }

  @override
  Future<TimeOfDay?> getMorningZikrAlarm() async {
    final time = sharedPreferences.getString(_morningZikrAlarmKey);
    return time != null ? _timeOfDayFromString(time) : null;
  }

  @override
  Future<TimeOfDay?> getNightZikrAlarm() async {
    final time = sharedPreferences.getString(_nightZikrAlarmKey);
    return time != null ? _timeOfDayFromString(time) : null;
  }

  @override
  Future<void> setLightTheme(bool value) async {
    await sharedPreferences.setBool(_isLightThemeKey, value);
  }

  @override
  Future<void> setIsVibrating(bool value) async {
    await sharedPreferences.setBool(_isVibratingKey, value);
  }

  @override
  Future<void> setMorningZikrAlarm(TimeOfDay time) async {
    await sharedPreferences.setString(
        _morningZikrAlarmKey, _timeOfDayToString(time));
  }

  @override
  Future<void> setNightZikrAlarm(TimeOfDay time) async {
    await sharedPreferences.setString(
        _nightZikrAlarmKey, _timeOfDayToString(time));
  }

  // Helper methods for TimeOfDay conversion
  String _timeOfDayToString(TimeOfDay time) {
    return '${time.hour}:${time.minute}';
  }

  TimeOfDay _timeOfDayFromString(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
