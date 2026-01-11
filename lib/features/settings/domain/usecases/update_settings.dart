import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UpdateSettings implements UseCase<void, UpdateSettingsParams> {
  final SettingsRepository repository;

  UpdateSettings(this.repository);

  @override
  Future<RequestResult<void>> call(UpdateSettingsParams params) async {
    if (params.isLightTheme != null) {
      final result = await repository.setLightTheme(params.isLightTheme!);
      if (result.isLeft()) return result;
    }

    if (params.isVibrating != null) {
      final result = await repository.setIsVibrating(params.isVibrating!);
      if (result.isLeft()) return result;
    }

    if (params.morningZikrAlarm != null) {
      final result =
          await repository.setMorningZikrAlarm(params.morningZikrAlarm!);
      if (result.isLeft()) return result;
    }

    if (params.nightZikrAlarm != null) {
      final result = await repository.setNightZikrAlarm(params.nightZikrAlarm!);
      if (result.isLeft()) return result;
    }

    return const Right(null);
  }
}

class UpdateSettingsParams extends Equatable {
  final bool? isLightTheme;
  final bool? isVibrating;
  final TimeOfDay? morningZikrAlarm;
  final TimeOfDay? nightZikrAlarm;

  const UpdateSettingsParams({
    this.isLightTheme,
    this.isVibrating,
    this.morningZikrAlarm,
    this.nightZikrAlarm,
  });

  @override
  List<Object?> get props => [
        isLightTheme,
        isVibrating,
        morningZikrAlarm,
        nightZikrAlarm,
      ];
}
