import 'package:bank_el_ziker/3_data/models/day_zikr_record.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../3_data/services/hive_db.dart';

part 'get_week_azkar_record_state.dart';

/**
 * this cubit gets all week record for line graph
 */
class GetWeekAzkarRecordCubit extends Cubit<GetWeekAzkarRecordState> {
  GetWeekAzkarRecordCubit() : super(GetWeekAzkarRecordInitial());

  final HiveDB _hiveDB = HiveDB();
  void getAllWeekAzkarRecord() async {
    emit(GetWeekAzkarRecordLoading());
    try {
      var dayZikrRecordBox =
          await _hiveDB.openAndGetBox(boxName: dayZikrRecordHiveBox);
      List<DayZikrRecord> weekRecord =
          List<DayZikrRecord>.from(dayZikrRecordBox.values);
      Map<int, int> map = {};

      // yup bit too complicated, but all it does is looping on all days to get the azkar you did in the week
      //it just returns a map<string,string> with key id of the zikr and value: counter of zikr
      for (var dayRecord in weekRecord) {
        for (var e in dayRecord.azkarRecordById.entries) {
          var x = map[e.key];
          if (x != null) {
            map[e.key] = x + e.value;
          } else {
            map[e.key] = e.value;
          }
        }
      }
      emit(GetWeekAzkarRecordLoaded(
          allWeekAzkarRecordsById: map,
          firstDayAzkarRecord: weekRecord.first.azkarRecordById,
          allWeekRecord: weekRecord));
    } catch (e) {
      emit(GetWeekAzkarRecordError());
    }
  }
}
