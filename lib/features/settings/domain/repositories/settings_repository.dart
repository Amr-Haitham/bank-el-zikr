import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<RequestResult<Settings>> getSettings();
  Future<RequestResult<void>> setLightTheme(bool isLightTheme);
  Future<RequestResult<void>> setIsVibrating(bool isVibrating);
  Future<RequestResult<void>> setMorningZikrAlarm(TimeOfDay time);
  Future<RequestResult<void>> setNightZikrAlarm(TimeOfDay time);
  Future<RequestResult<void>> setSelectedLanguage(String language);
  Future<RequestResult<void>> setHasSeenOnboarding(bool value);
  Future<RequestResult<void>> setDhikrFont(String value);
  Future<RequestResult<void>> setTextSize(String value);
  Future<RequestResult<void>> setUseArabicNumerals(bool value);
  Future<RequestResult<void>> setAdhkarRemindersEnabled(bool value);
  Future<RequestResult<void>> setReminderMode(String value);
  Future<RequestResult<void>> setMorningReminderEnabled(bool value);
  Future<RequestResult<void>> setEveningReminderEnabled(bool value);
  Future<RequestResult<void>> setGeneralDhikrReminderEnabled(bool value);
  Future<RequestResult<void>> setGeneralDhikrReminderLanguage(String value);
}
