import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../3_data/models/zikr.dart';
import '../../../3_data/services/hive_db.dart';

part 'add_custom_zikr_state.dart';

class AddCustomZikrCubit extends Cubit<AddCustomZikrState> {
  AddCustomZikrCubit() : super(AddCustomZikrInitial());
  final HiveDB _hiveDB = HiveDB();

  void addCustomZikr({required String customZikrContent}) async {
    emit(AddCustomZikrLoading());
    try {
      Box azkarBox = await _hiveDB.openAndGetBox(boxName: zikrHiveBox);
      Zikr newZikr = Zikr(
          isCustomZikr: true,
          content: customZikrContent,
          id: azkarBox.values.isEmpty ? 0 : azkarBox.values.last.id + 1,
          description: null);

      azkarBox.add(newZikr);
      emit(AddCustomZikrLoaded(zikr: newZikr));
    } catch (e) {
      emit(AddCustomZikrError());
    }
  }
}
