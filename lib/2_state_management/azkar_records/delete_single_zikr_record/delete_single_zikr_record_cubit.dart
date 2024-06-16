
import 'package:bank_el_ziker/3_data/services/hive_db.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../3_data/models/day_zikr_record.dart';

part 'delete_single_zikr_record_state.dart';

class DeleteSingleZikrRecordCubit extends Cubit<DeleteSingleZikrRecordState> {
  DeleteSingleZikrRecordCubit() : super(DeleteSingleZikrRecordInitial());
      final HiveDB _hiveDB = HiveDB();

  void deleteZikrRecord({required int zikrId}) async {
    emit(DeleteSingleZikrRecordError());
    try {

      var dayZikrRecordBox =
          await _hiveDB.openAndGetBox(boxName: dayZikrRecordHiveBox);

      for (var i = 0; i < dayZikrRecordBox.values.length; i++) {
        DayZikrRecord dayZikrRecord = dayZikrRecordBox.values.toList()[i];
        dayZikrRecord.azkarRecordById
            .removeWhere((key, value) => zikrId == key);
        dayZikrRecordBox.putAt(i, dayZikrRecord);
      }

      emit(DeleteSingleZikrRecordLoaded());
    } catch (e) {
      emit(DeleteSingleZikrRecordError());
    }
  }
}
