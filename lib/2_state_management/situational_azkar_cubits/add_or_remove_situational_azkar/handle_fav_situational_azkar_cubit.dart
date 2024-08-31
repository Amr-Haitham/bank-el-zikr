import 'package:bank_el_ziker/3_data/services/fav_situational_azkar_shared_pref.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'handle_fav_situational_azkar_state.dart';

class HandleFavSituationalAzkarCubit
    extends Cubit<HandleFavSituationalAzkarState> {
  HandleFavSituationalAzkarCubit() : super(HandleFavSituationalAzkarInitial());
  final FavSituationalAzkarSharePref _favSituationalAzkarSharePref =
      FavSituationalAzkarSharePref();
  void addOrRemoveFromFavourites(String id) async {
    emit(HandleFavSituationalAzkarLoading());
    try {
      await _favSituationalAzkarSharePref.addOrRemoveFromFavourites(id);

      List<String> ids = await _favSituationalAzkarSharePref.getAllIds();
      emit(HandleFavSituationalAzkarLoaded(ids: ids));
    } catch (e) {
      emit(HandleFavSituationalAzkarError());
    }
  }

  getAllIds() async {
    emit(HandleFavSituationalAzkarLoading());
    try {
      List<String> ids = await _favSituationalAzkarSharePref.getAllIds();
      emit(HandleFavSituationalAzkarLoaded(ids: ids));
    } catch (e) {
      emit(HandleFavSituationalAzkarError());
    }
  }
}
