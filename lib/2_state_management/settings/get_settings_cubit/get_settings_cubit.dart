import 'package:bank_el_ziker/3_data/services/settings_shared_prefs.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'get_settings_state.dart';

class GetSettingsCubit extends Cubit<GetSettingsState> {
  GetSettingsCubit() : super(GetSettingsInitial());
  final SettingsSharedPrefs _settingsSharedPrefs = SettingsSharedPrefs();

  void getSettings() async {
    emit(GetSettingsLoading());
    try {
      var isLightTheme = await _settingsSharedPrefs.getIsLightTheme();
      var morningZikrAlarm = await _settingsSharedPrefs.getMorningZikrAlarm();
      var nightZikrAlarm = await _settingsSharedPrefs.getNightZikrAlarm();
      var isVibrating = await _settingsSharedPrefs.getIsVibrating();
      emit(GetSettingsLoaded(
          isLightTheme: isLightTheme,
          morningZikrAlarm: morningZikrAlarm,
          nightZikrAlarm: nightZikrAlarm,
          isVibrating: isVibrating));
    } catch (e) {
      emit(GetSettingsError());
    }
  }
}
