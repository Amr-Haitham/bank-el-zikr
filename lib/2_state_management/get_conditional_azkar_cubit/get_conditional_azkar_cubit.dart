import 'package:bank_el_ziker/3_data/models/zikr.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../3_data/services/hive_db.dart';

part 'get_conditional_azkar_state.dart';

class GetConditionalAzkarCubit extends Cubit<GetConditionalAzkarState> {
  GetConditionalAzkarCubit() : super(GetConditionalAzkarInitial());
  final HiveDB _hiveDB = HiveDB();

  getConditionalAzkar() async {
    emit(GetConditionalAzkarLoading());

    try {
      Box conditionalAzkarBox =
          await _hiveDB.openAndGetBox(boxName: conditionalAzkarHiveBox);
      emit(GetConditionalAzkarLoaded(
          conditionalAzkar: List<Zikr>.from(conditionalAzkarBox.values)));
    } catch (e) {
      emit(GetConditionalAzkarError());
    }
  }
}
