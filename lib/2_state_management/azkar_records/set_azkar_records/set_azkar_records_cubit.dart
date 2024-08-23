import 'dart:collection';

import 'package:bank_el_ziker/3_data/models/day_zikr_record.dart';
import 'package:bank_el_ziker/3_data/services/hive_db.dart';
import 'package:bank_el_ziker/consts/general_functions.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'set_azkar_records_state.dart';
  //Generally, this cubit fixes records with all azkar said, and increments a zikr if needed
  // this fixes things up for GetWeekAzkarRecordCubit to get all records to show it in the graph 

class SetAzkarRecordsCubit extends Cubit<SetAzkarRecordsState> {
  SetAzkarRecordsCubit() : super(SetAzkarRecordsInitial());

  final HiveDB _hiveDB = HiveDB();

  List<DayZikrRecord> _fixRecords(Queue<DayZikrRecord> dayZikrRecords) {
    DateTime dateTimeNow = DateTime.now();
    DateTime dateTimeNowStartFrom12am =
        DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
        //we just get the difference here to calculate how many days from now to the last time we fixed the records
        //then we add days with respect to that difference, to ensure we are updated to today
    int difference =
        dateTimeNowStartFrom12am.difference(dayZikrRecords.first.dateTime).inDays;

    while (difference > 0) {
      dayZikrRecords.removeLast();
      var dateTime = dayZikrRecords.first.dateTime.add(const Duration(days: 1));
      dayZikrRecords.addFirst(DayZikrRecord(
          id: dateIdGenerator(dateTime),
          dateTime: dateTime,
          azkarRecordById: {}));

      difference--;
    }
    return dayZikrRecords.toList();
  }

  void incrementCertainZikrRecordOrJustFixRecords(int? zikrId) async {
    emit(SetAzkarRecordsLoading());
    try {
      var dayZikrRecordBox =
          await _hiveDB.openAndGetBox(boxName: dayZikrRecordHiveBox);
      var oldRecords = Queue<DayZikrRecord>.from(dayZikrRecordBox.values);
      var newDayZikrRecordsList = _fixRecords(oldRecords);

      if (newDayZikrRecordsList.first.id !=
          (dayZikrRecordBox.values.first as DayZikrRecord).id) {
        await dayZikrRecordBox.clear();
        await dayZikrRecordBox.addAll(newDayZikrRecordsList);
      }


      if (zikrId != null) {
        DayZikrRecord dayZikrRecord = dayZikrRecordBox.values.first;
        var zikrCounter = dayZikrRecord.azkarRecordById[zikrId];
        zikrCounter != null ? zikrCounter++ : zikrCounter = 1;
        dayZikrRecord.azkarRecordById[zikrId] = zikrCounter;
        dayZikrRecordBox.putAt(0, dayZikrRecord);
      }
      emit(SetAzkarRecordsLoaded());
    } catch (e) {
      emit(SetAzkarRecordsError());
    }
  }
}
