import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';
import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';

part 'update_custom_zikr_state.dart';

class UpdateCustomZikrCubit extends Cubit<UpdateCustomZikrState> {
  UpdateCustomZikrCubit() : super(UpdateCustomZikrInitial());
  final HiveDB _hiveDB = HiveDB();
  // here i update the custom azkar (the one added by user)
  void updateCustomZikr(
      {required Zikr zikr,
      required String newContent,
      required String newZikrDescription,
      required int zikrIndex}) async {
    emit(UpdateCustomZikrLoading());
    try {
      Box azkarBox = await _hiveDB.openAndGetBox(boxName: zikrHiveBox);

      //Mr. reader, you might confuse again why i use zikr index??
      //because hive doesn't have update statement other that putAt
      // I get the zikr by zikrIndex, then update it and put it exactly in its place

      zikr.content = newContent;
      zikr.description = newZikrDescription;
      azkarBox.putAt(zikrIndex, zikr);
      emit(UpdateCustomZikrLoaded());
    } catch (e) {
      emit(UpdateCustomZikrError());
    }
  }
}
