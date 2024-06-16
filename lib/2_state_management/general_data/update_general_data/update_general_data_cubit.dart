import 'package:bank_el_ziker/3_data/models/general_data.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../3_data/services/hive_db.dart';

part 'update_general_data_state.dart';

class UpdateGeneralDataCubit extends Cubit<UpdateGeneralDataState> {
  UpdateGeneralDataCubit() : super(UpdateGeneralDataInitial());
  void incrementAccountBalance() async {
    emit(UpdateGeneralDataLoading());
    HiveDB hiveDb = HiveDB();
    try {
      var generalDataBox =
          await hiveDb.openAndGetBox(boxName: generalDataHiveBox);

      GeneralData generalData = generalDataBox.get("generalData");
      generalData.accountBalance++;
      
      generalDataBox.put("generalData", generalData);
      emit(UpdateGeneralDataUpdated());
    } catch (e) {
      emit(UpdateGeneralDataError());
    }
  }
  void updateCounter(int currentCounter) async {
    emit(UpdateGeneralDataLoading());
    HiveDB hiveDb = HiveDB();
    try {
      var generalDataBox =
          await hiveDb.openAndGetBox(boxName: generalDataHiveBox);

      GeneralData generalData = generalDataBox.get("generalData");
      generalData.currentCounter=currentCounter;
      generalDataBox.put("generalData", generalData);
      emit(UpdateGeneralDataUpdated());
    } catch (e) {
      emit(UpdateGeneralDataError());
    }
  }

  void updateGeneralDataGoal(
       int? currentGoal) async {
    emit(UpdateGeneralDataLoading());
    HiveDB hiveDb = HiveDB();
    try {
      var generalDataBox =
          await hiveDb.openAndGetBox(boxName: generalDataHiveBox);
      GeneralData generalData = generalDataBox.get("generalData");
      generalData.currentGoal = currentGoal;
      generalDataBox.put("generalData", generalData);
      emit(UpdateGeneralDataUpdated());
    } catch (e) {
      emit(UpdateGeneralDataError());
    }
  }
  void updateGeneralDataCurrentZikr(int currentZikrId) async {
    emit(UpdateGeneralDataLoading());
    HiveDB hiveDb = HiveDB();
    try {
      var generalDataBox =
          await hiveDb.openAndGetBox(boxName: generalDataHiveBox);
      GeneralData generalData = generalDataBox.get("generalData");
      generalData.currentZikrId = currentZikrId;
      generalDataBox.put("generalData", generalData);
      emit(UpdateGeneralDataUpdated());
    } catch (e) {
      emit(UpdateGeneralDataError());
    }
  }
}
