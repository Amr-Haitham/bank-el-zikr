import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsLocalDataSource {
  Future<bool> getIsLightTheme();
  Future<bool> getIsVibrating();
  Future<TimeOfDay?> getMorningZikrAlarm();
  Future<TimeOfDay?> getNightZikrAlarm();
  Future<String> getSelectedLanguage();
  Future<bool> getHasSeenOnboarding();
  Future<String> getDhikrFont();
  Future<String> getTextSize();
  Future<bool> getUseArabicNumerals();
  Future<bool> getAdhkarRemindersEnabled();
  Future<String> getReminderMode();
  Future<bool> getMorningReminderEnabled();
  Future<bool> getEveningReminderEnabled();
  Future<void> setLightTheme(bool value);
  Future<void> setIsVibrating(bool value);
  Future<void> setMorningZikrAlarm(TimeOfDay time);
  Future<void> setNightZikrAlarm(TimeOfDay time);
  Future<void> setSelectedLanguage(String value);
  Future<void> setHasSeenOnboarding(bool value);
  Future<void> setDhikrFont(String value);
  Future<void> setTextSize(String value);
  Future<void> setUseArabicNumerals(bool value);
  Future<void> setAdhkarRemindersEnabled(bool value);
  Future<void> setReminderMode(String value);
  Future<void> setMorningReminderEnabled(bool value);
  Future<void> setEveningReminderEnabled(bool value);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _isLightThemeKey = 'isLightTheme';
  static const String _morningZikrAlarmKey = 'morningZikrAlarm';
  static const String _nightZikrAlarmKey = 'nightZikrAlarm';
  static const String _isVibratingKey = 'isVibrating';
  static const String _selectedLanguageKey = 'selectedLanguage';
  static const String _hasSeenOnboardingKey = 'hasSeenOnboarding';
  static const String _dhikrFontKey = 'dhikrFont';
  static const String _textSizeKey = 'textSize';
  static const String _useArabicNumeralsKey = 'useArabicNumerals';
  static const String _adhkarRemindersEnabledKey = 'adhkarRemindersEnabled';
  static const String _reminderModeKey = 'reminderMode';
  static const String _morningReminderEnabledKey = 'morningReminderEnabled';
  static const String _eveningReminderEnabledKey = 'eveningReminderEnabled';

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

  @override
  Future<String> getSelectedLanguage() async {
    return sharedPreferences.getString(_selectedLanguageKey) ?? 'ar';
  }

  @override
  Future<bool> getHasSeenOnboarding() async {
    return sharedPreferences.getBool(_hasSeenOnboardingKey) ?? false;
  }

  @override
  Future<void> setSelectedLanguage(String value) async {
    await sharedPreferences.setString(_selectedLanguageKey, value);
  }

  @override
  Future<void> setHasSeenOnboarding(bool value) async {
    await sharedPreferences.setBool(_hasSeenOnboardingKey, value);
  }

  @override
  Future<String> getDhikrFont() async {
    return sharedPreferences.getString(_dhikrFontKey) ?? 'clear';
  }

  @override
  Future<void> setDhikrFont(String value) async {
    await sharedPreferences.setString(_dhikrFontKey, value);
  }

  @override
  Future<String> getTextSize() async {
    return sharedPreferences.getString(_textSizeKey) ?? 'medium';
  }

  @override
  Future<void> setTextSize(String value) async {
    await sharedPreferences.setString(_textSizeKey, value);
  }

  @override
  Future<bool> getUseArabicNumerals() async {
    return sharedPreferences.getBool(_useArabicNumeralsKey) ?? true;
  }

  @override
  Future<void> setUseArabicNumerals(bool value) async {
    await sharedPreferences.setBool(_useArabicNumeralsKey, value);
  }

  @override
  Future<bool> getAdhkarRemindersEnabled() async {
    return sharedPreferences.getBool(_adhkarRemindersEnabledKey) ?? false;
  }

  @override
  Future<void> setAdhkarRemindersEnabled(bool value) async {
    await sharedPreferences.setBool(_adhkarRemindersEnabledKey, value);
  }

  @override
  Future<String> getReminderMode() async {
    return sharedPreferences.getString(_reminderModeKey) ?? 'auto';
  }

  @override
  Future<void> setReminderMode(String value) async {
    await sharedPreferences.setString(_reminderModeKey, value);
  }

  @override
  Future<bool> getMorningReminderEnabled() async {
    return sharedPreferences.getBool(_morningReminderEnabledKey) ?? true;
  }

  @override
  Future<void> setMorningReminderEnabled(bool value) async {
    await sharedPreferences.setBool(_morningReminderEnabledKey, value);
  }

  @override
  Future<bool> getEveningReminderEnabled() async {
    return sharedPreferences.getBool(_eveningReminderEnabledKey) ?? true;
  }

  @override
  Future<void> setEveningReminderEnabled(bool value) async {
    await sharedPreferences.setBool(_eveningReminderEnabledKey, value);
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
