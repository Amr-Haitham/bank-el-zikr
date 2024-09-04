import 'package:bank_el_ziker/3_data/services/settings_shared_prefs.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'set_settings_state.dart';

class SetSettingsCubit extends Cubit<SetSettingsState> {
  SetSettingsCubit() : super(SetSettingsInitial());
  final SettingsSharedPrefs _settingsSharedPrefs = SettingsSharedPrefs();
  setTheme({required bool isLightTheme}) async {
    emit(SetSettingsLoading());
    try {
      await _settingsSharedPrefs.setLightTheme(isLightTheme);
      emit(SetSettingsLoaded());
    } catch (e) {
      emit(SetSettingsError());
    }
  }
  setIsVibrating({required bool isVibrating}) async {
    emit(SetSettingsLoading());
    try {
      await _settingsSharedPrefs.setIsVibrating(isVibrating);
      emit(SetSettingsLoaded());
    } catch (e) {
      emit(SetSettingsError());
    }
  }

  setMorningZikrAlarm({required TimeOfDay time}) async {
    emit(SetSettingsLoading());
    try {
      await _settingsSharedPrefs.setMorningZikrAlarm(time);
      emit(SetSettingsLoaded());
    } catch (e) {
      emit(SetSettingsError());
    }
  }

  setEveningZikrAlarm({required TimeOfDay time}) async {
    emit(SetSettingsLoading());
    try {
      await _settingsSharedPrefs.setNightZikrAlarm(time);
      emit(SetSettingsLoaded());
    } catch (e) {
      emit(SetSettingsError());
    }
  }
}
