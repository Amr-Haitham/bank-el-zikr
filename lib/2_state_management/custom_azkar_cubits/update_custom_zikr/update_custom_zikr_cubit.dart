import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../3_data/models/zikr.dart';
import '../../../3_data/services/hive_db.dart';

part 'update_custom_zikr_state.dart';

class UpdateCustomZikrCubit extends Cubit<UpdateCustomZikrState> {
  UpdateCustomZikrCubit() : super(UpdateCustomZikrInitial());
  final HiveDB _hiveDB = HiveDB();

  void updateCustomZikr(
      {required Zikr zikr,
      required String newContent,
      required int zikrIndex}) async {
    emit(UpdateCustomZikrLoading());
    try {
      Box azkarBox = await _hiveDB.openAndGetBox(boxName: zikrHiveBox);

      // azkarBox.deleteAt(zikrIndex);
      zikr.content = newContent;
      azkarBox.putAt(zikrIndex, zikr);
      emit(UpdateCustomZikrLoaded());
    } catch (e) {
      emit(UpdateCustomZikrError());
    }
  }
}
