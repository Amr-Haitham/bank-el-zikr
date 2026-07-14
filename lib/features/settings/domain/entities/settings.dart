import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Settings extends Equatable {
  final bool isLightTheme;
  final TimeOfDay? morningZikrAlarm;
  final TimeOfDay? nightZikrAlarm;
  final bool isVibrating;
  final Locale locale;

  const Settings({
    required this.isLightTheme,
    this.morningZikrAlarm,
    this.nightZikrAlarm,
    required this.isVibrating,
    this.locale = const Locale('ar'),
  });

  @override
  List<Object?> get props => [
        isLightTheme,
        morningZikrAlarm,
        nightZikrAlarm,
        isVibrating,
        locale,
      ];

  Settings copyWith({
    bool? isLightTheme,
    TimeOfDay? morningZikrAlarm,
    TimeOfDay? nightZikrAlarm,
    bool? isVibrating,
    Locale? locale,
  }) {
    return Settings(
      isLightTheme: isLightTheme ?? this.isLightTheme,
      morningZikrAlarm: morningZikrAlarm ?? this.morningZikrAlarm,
      nightZikrAlarm: nightZikrAlarm ?? this.nightZikrAlarm,
      isVibrating: isVibrating ?? this.isVibrating,
      locale: locale ?? this.locale,
    );
  }
}
