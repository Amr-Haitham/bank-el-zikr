import 'package:bank_el_ziker/3_data/models/hijri_date.dart';
import 'package:bank_el_ziker/3_data/services/hijri_date_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_hijri_date_state.dart';

class GetHijriDateCubit extends Cubit<GetHijriDateState> {
  GetHijriDateCubit() : super(GetHijriDateInitial());

  getHijriDate() async {
    emit(GetHijriDateLoading());

    try {
      var date = await HijriDateApi().getTodaysHijriDate();
      emit(GetHijriDateLoaded(hijriDate: date));
    } catch (e) {
      emit(GetHijriDateError());
    }
  }
}
