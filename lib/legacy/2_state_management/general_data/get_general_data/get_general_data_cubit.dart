import 'package:bank_el_ziker/features/zikr_counter/data/models/general_data_model.dart';
import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_general_data_state.dart';

class GetGeneralDataCubit extends Cubit<GetGeneralDataState> {
  GetGeneralDataCubit() : super(GetGeneralDataInitial());
  //this gets the general data
  /*
  currentZikrId
  currentCounter
  currentGoal
  accountBalance
 */
  void getGeneralData() async {
    emit(GetGeneralDataLoading());
    try {
      HiveDB hiveDb = HiveDB();
      var generalDataBox =
          await hiveDb.openAndGetBox(boxName: generalDataHiveBox);

      emit(GetGeneralDataLoaded(generalData: generalDataBox.values.first));
    } catch (e) {
      emit(GetGeneralDataError());
    }
  }
}
