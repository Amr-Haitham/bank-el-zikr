import 'package:bank_el_ziker/3_data/models/general_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../3_data/services/hive_db.dart';

part 'get_current_zikr_state.dart';

class GetCurrentZikrCubit extends Cubit<GetCurrentZikrState> {
  GetCurrentZikrCubit() : super(GetCurrentZikrInitial());

  //this gets the general data
  /*
  currentZikrId
  currentCounter
  currentGoal
  accountBalance
 */

//then passes the current zikr id to the state
  getCurrentZikr() async {
    emit(GetCurrentZikrLoading());
    try {
      HiveDB hiveDb = HiveDB();
      var generalDataBox =
          await hiveDb.openAndGetBox(boxName: generalDataHiveBox);
      GeneralData generalData = generalDataBox.values.first;
      emit(GetCurrentZikrLoaded(zikrId: generalData.currentZikrId));
    } catch (e) {
      emit(GetCurrentZikrError());
    }
  }
}
