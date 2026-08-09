import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:bank_el_ziker/features/settings/data/datasources/settings_local_datasource.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<Settings>> getSettings() async {
    try {
      final isLightTheme = await localDataSource.getIsLightTheme();
      final isVibrating = await localDataSource.getIsVibrating();
      final morningZikrAlarm = await localDataSource.getMorningZikrAlarm();
      final nightZikrAlarm = await localDataSource.getNightZikrAlarm();
      final selectedLanguage = await localDataSource.getSelectedLanguage();
      final hasSeenOnboarding = await localDataSource.getHasSeenOnboarding();
      final dhikrFont = await localDataSource.getDhikrFont();
      final textSize = await localDataSource.getTextSize();
      final useArabicNumerals = await localDataSource.getUseArabicNumerals();
      final adhkarRemindersEnabled =
          await localDataSource.getAdhkarRemindersEnabled();
      final reminderMode = await localDataSource.getReminderMode();
      final morningReminderEnabled =
          await localDataSource.getMorningReminderEnabled();
      final eveningReminderEnabled =
          await localDataSource.getEveningReminderEnabled();
      final generalDhikrReminderEnabled =
          await localDataSource.getGeneralDhikrReminderEnabled();
      final generalDhikrReminderLanguage =
          await localDataSource.getGeneralDhikrReminderLanguage();

      return Right(Settings(
        isLightTheme: isLightTheme,
        isVibrating: isVibrating,
        morningZikrAlarm: morningZikrAlarm,
        nightZikrAlarm: nightZikrAlarm,
        selectedLanguage: selectedLanguage,
        hasSeenOnboarding: hasSeenOnboarding,
        dhikrFont: dhikrFont,
        textSize: textSize,
        useArabicNumerals: useArabicNumerals,
        adhkarRemindersEnabled: adhkarRemindersEnabled,
        reminderMode: reminderMode,
        morningReminderEnabled: morningReminderEnabled,
        eveningReminderEnabled: eveningReminderEnabled,
        generalDhikrReminderEnabled: generalDhikrReminderEnabled,
        generalDhikrReminderLanguage: generalDhikrReminderLanguage,
      ));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setLightTheme(bool isLightTheme) async {
    try {
      await localDataSource.setLightTheme(isLightTheme);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setIsVibrating(bool isVibrating) async {
    try {
      await localDataSource.setIsVibrating(isVibrating);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setMorningZikrAlarm(TimeOfDay time) async {
    try {
      await localDataSource.setMorningZikrAlarm(time);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setNightZikrAlarm(TimeOfDay time) async {
    try {
      await localDataSource.setNightZikrAlarm(time);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setSelectedLanguage(String language) async {
    try {
      await localDataSource.setSelectedLanguage(language);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setHasSeenOnboarding(bool value) async {
    try {
      await localDataSource.setHasSeenOnboarding(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setDhikrFont(String value) async {
    try {
      await localDataSource.setDhikrFont(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setTextSize(String value) async {
    try {
      await localDataSource.setTextSize(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setUseArabicNumerals(bool value) async {
    try {
      await localDataSource.setUseArabicNumerals(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setAdhkarRemindersEnabled(bool value) async {
    try {
      await localDataSource.setAdhkarRemindersEnabled(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setReminderMode(String value) async {
    try {
      await localDataSource.setReminderMode(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setMorningReminderEnabled(bool value) async {
    try {
      await localDataSource.setMorningReminderEnabled(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setEveningReminderEnabled(bool value) async {
    try {
      await localDataSource.setEveningReminderEnabled(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setGeneralDhikrReminderEnabled(
      bool value) async {
    try {
      await localDataSource.setGeneralDhikrReminderEnabled(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<RequestResult<void>> setGeneralDhikrReminderLanguage(
      String value) async {
    try {
      await localDataSource.setGeneralDhikrReminderLanguage(value);
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
