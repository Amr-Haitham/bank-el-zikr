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

      return Right(Settings(
        isLightTheme: isLightTheme,
        isVibrating: isVibrating,
        morningZikrAlarm: morningZikrAlarm,
        nightZikrAlarm: nightZikrAlarm,
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
}
