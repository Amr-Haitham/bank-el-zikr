import 'package:bank_el_ziker/3_data/models/zikr.dart';
import 'package:bank_el_ziker/3_data/services/hive_db.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit() : super(AzkarInitial());
  final HiveDB _hiveDB = HiveDB();
  void getAllAzkar() async {
    emit(AzkarLoading());
    try {
      Box zikrBox = await _hiveDB.openAndGetBox(boxName: zikrHiveBox);
      Box customAzkarBox =
          await _hiveDB.openAndGetBox(boxName: customAzkarHiveBox);
      var listOfAzkar = List<Zikr>.from(zikrBox.values);
      listOfAzkar.addAll(List<Zikr>.from(customAzkarBox.values));
      emit(AzkarLoaded(azkar: listOfAzkar));
    } catch (e) {
      emit(AzkarError());
    }
  }
}
