import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../3_data/services/hive_db.dart';

part 'delete_custom_zikr_state.dart';

class DeleteCustomZikrCubit extends Cubit<DeleteCustomZikrState> {
  DeleteCustomZikrCubit() : super(DeleteCustomZikrInitial());
  final HiveDB _hiveDB = HiveDB();

  void deleteCustomZikr({required int zikrIndex}) async {
    emit(DeleteCustomZikrLoading());
    try {
      Box azkarBox = await _hiveDB.openAndGetBox(boxName: zikrHiveBox);
//note here i minues the custom index from the length of the original azkar so i know exacly the index of the custom azkar in its list

      azkarBox.deleteAt(zikrIndex);
      emit(DeleteCustomZikrLoaded());
    } catch (e) {
      emit(DeleteCustomZikrError());
    }
  }
}
