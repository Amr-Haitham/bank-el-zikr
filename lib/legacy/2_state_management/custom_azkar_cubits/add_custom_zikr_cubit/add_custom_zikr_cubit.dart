import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';
import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';

part 'add_custom_zikr_state.dart';

class AddCustomZikrCubit extends Cubit<AddCustomZikrState> {
  AddCustomZikrCubit() : super(AddCustomZikrInitial());
  final HiveDB _hiveDB = HiveDB();
  //this function adds a custom zikr (zikr made by user) to the azkar list
  void addCustomZikr({required String customZikrContent,required String? customZikrDescription}) async {
    emit(AddCustomZikrLoading());
    try {

      Box azkarBox = await _hiveDB.openAndGetBox(boxName: zikrHiveBox);
      Zikr newZikr = Zikr(
          isCustomZikr: true,
          content: customZikrContent,
          id: azkarBox.values.isEmpty ? 0 : azkarBox.values.last.id + 1,
          description: customZikrDescription);

      azkarBox.add(newZikr);
      emit(AddCustomZikrLoaded(zikr: newZikr));
    } catch (e) {
      emit(AddCustomZikrError());
    }
  }
}
