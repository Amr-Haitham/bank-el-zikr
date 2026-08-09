import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Settings extends Equatable {
  final bool isLightTheme;
  final TimeOfDay? morningZikrAlarm;
  final TimeOfDay? nightZikrAlarm;
  final bool isVibrating;
  final String selectedLanguage;
  final bool hasSeenOnboarding;

  /// 'clear' or 'uthmani'.
  final String dhikrFont;

  /// 'small', 'medium', or 'large'.
  final String textSize;

  /// true = Arabic-Indic digits (١٢٣), false = Western digits (123).
  final bool useArabicNumerals;

  final bool adhkarRemindersEnabled;

  /// 'manual' or 'auto'.
  final String reminderMode;
  final bool morningReminderEnabled;
  final bool eveningReminderEnabled;

  const Settings({
    required this.isLightTheme,
    this.morningZikrAlarm,
    this.nightZikrAlarm,
    required this.isVibrating,
    this.selectedLanguage = 'ar',
    this.hasSeenOnboarding = false,
    this.dhikrFont = 'clear',
    this.textSize = 'medium',
    this.useArabicNumerals = true,
    this.adhkarRemindersEnabled = false,
    this.reminderMode = 'auto',
    this.morningReminderEnabled = true,
    this.eveningReminderEnabled = true,
  });

  @override
  List<Object?> get props => [
        isLightTheme,
        morningZikrAlarm,
        nightZikrAlarm,
        isVibrating,
        selectedLanguage,
        hasSeenOnboarding,
        dhikrFont,
        textSize,
        useArabicNumerals,
        adhkarRemindersEnabled,
        reminderMode,
        morningReminderEnabled,
        eveningReminderEnabled,
      ];

  Settings copyWith({
    bool? isLightTheme,
    TimeOfDay? morningZikrAlarm,
    TimeOfDay? nightZikrAlarm,
    bool? isVibrating,
    String? selectedLanguage,
    bool? hasSeenOnboarding,
    String? dhikrFont,
    String? textSize,
    bool? useArabicNumerals,
    bool? adhkarRemindersEnabled,
    String? reminderMode,
    bool? morningReminderEnabled,
    bool? eveningReminderEnabled,
  }) {
    return Settings(
      isLightTheme: isLightTheme ?? this.isLightTheme,
      morningZikrAlarm: morningZikrAlarm ?? this.morningZikrAlarm,
      nightZikrAlarm: nightZikrAlarm ?? this.nightZikrAlarm,
      isVibrating: isVibrating ?? this.isVibrating,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      hasSeenOnboarding: hasSeenOnboarding ?? this.hasSeenOnboarding,
      dhikrFont: dhikrFont ?? this.dhikrFont,
      textSize: textSize ?? this.textSize,
      useArabicNumerals: useArabicNumerals ?? this.useArabicNumerals,
      adhkarRemindersEnabled:
          adhkarRemindersEnabled ?? this.adhkarRemindersEnabled,
      reminderMode: reminderMode ?? this.reminderMode,
      morningReminderEnabled:
          morningReminderEnabled ?? this.morningReminderEnabled,
      eveningReminderEnabled:
          eveningReminderEnabled ?? this.eveningReminderEnabled,
    );
  }
}
