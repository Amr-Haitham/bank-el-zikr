import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsSharedPrefs {
  static const String _isLightThemeKey = 'isLightTheme';
  static const String _morningZikrAlarmKey = 'morningZikrAlarm';
  static const String _nightZikrAlarmKey = 'nightZikrAlarm';
  static const String _isVibratingKey = 'isVibrating';

  // Getters
  Future<bool> getIsLightTheme() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(_isLightThemeKey) ?? true;
  }

  Future<bool> getIsVibrating() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(_isVibratingKey) ?? true;
  }

  Future<TimeOfDay?> getMorningZikrAlarm() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final time = preferences.getString(_morningZikrAlarmKey);
    return time != null ? _timeOfDayFromString(time) : null;
  }

  Future<TimeOfDay?> getNightZikrAlarm() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final time = preferences.getString(_nightZikrAlarmKey);
    return time != null ? _timeOfDayFromString(time) : null;
  }

  // Setters
  Future<void> setLightTheme(bool value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_isLightThemeKey, value);
  }

  // Setters
  Future<void> setIsVibrating(bool value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_isVibratingKey, value);
  }

  Future<void> setMorningZikrAlarm(TimeOfDay time) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_morningZikrAlarmKey, _timeOfDayToString(time));
  }

  Future<void> setNightZikrAlarm(TimeOfDay time) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_nightZikrAlarmKey, _timeOfDayToString(time));
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
