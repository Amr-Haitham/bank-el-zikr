import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/domain/usecases/get_settings.dart';
import 'package:bank_el_ziker/features/settings/domain/usecases/update_settings.dart';
import 'package:flutter/material.dart';

class SettingsCubit extends RequestCubit<Settings> {
  final GetSettings getSettings;
  final UpdateSettings updateSettings;

  SettingsCubit({
    required this.getSettings,
    required this.updateSettings,
  }) : super(
          callOnCreate: true,
          request: () => getSettings(const NoParams()),
        );

  Future<void> setTheme(bool isLightTheme) async {
    final result = await updateSettings(
      UpdateSettingsParams(isLightTheme: isLightTheme),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setVibration(bool isVibrating) async {
    final result = await updateSettings(
      UpdateSettingsParams(isVibrating: isVibrating),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setMorningAlarm(TimeOfDay time) async {
    final result = await updateSettings(
      UpdateSettingsParams(morningZikrAlarm: time),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }

  Future<void> setNightAlarm(TimeOfDay time) async {
    final result = await updateSettings(
      UpdateSettingsParams(nightZikrAlarm: time),
    );
    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(),
    );
  }
}
