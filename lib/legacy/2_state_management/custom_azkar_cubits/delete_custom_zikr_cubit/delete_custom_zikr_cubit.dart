import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';

part 'delete_custom_zikr_state.dart';

class DeleteCustomZikrCubit extends Cubit<DeleteCustomZikrState> {
  DeleteCustomZikrCubit() : super(DeleteCustomZikrInitial());
  final HiveDB _hiveDB = HiveDB();

  //this function adds a custom zikr (zikr made by user) to the azkar list
  void deleteCustomZikr({required int zikrIndex}) async {
    emit(DeleteCustomZikrLoading());
    try {
      Box azkarBox = await _hiveDB.openAndGetBox(boxName: zikrHiveBox);
      //Note: Why do i delete by index? Because simply azkarBox doesn't have where statement, or delete by id, id does only have index
      //And what if I treat index as Id Mr. Amr?? It won't be good, because indexes can be with a certain zikr then be for another zikr the other time
      // soo I use index to delete...
      //But what happens to the record?? the record is deleted in another cubit
      azkarBox.deleteAt(zikrIndex);
      emit(DeleteCustomZikrLoaded());
    } catch (e) {
      emit(DeleteCustomZikrError());
    }
  }
}
