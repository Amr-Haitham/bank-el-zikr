import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<RequestResult<Settings>> getSettings();
  Future<RequestResult<void>> setLightTheme(bool isLightTheme);
  Future<RequestResult<void>> setIsVibrating(bool isVibrating);
  Future<RequestResult<void>> setMorningZikrAlarm(TimeOfDay time);
  Future<RequestResult<void>> setNightZikrAlarm(TimeOfDay time);
}
