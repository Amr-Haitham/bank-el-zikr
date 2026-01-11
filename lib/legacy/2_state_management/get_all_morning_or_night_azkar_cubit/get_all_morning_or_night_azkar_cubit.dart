import 'package:bank_el_ziker/features/morning_night_azkar/data/models/morning_night_zikr_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';

part 'get_all_morning_or_night_azkar_state.dart';

class GetAllMorningOrNightAzkarCubit
    extends Cubit<GetAllMorningOrNightAzkarState> {
  GetAllMorningOrNightAzkarCubit() : super(GetAllMorningOrNightAzkarInitial());
  final HiveDB _hiveDB = HiveDB();

  getAllMorningOrNightAzkar({required bool isMorningZikr}) async {
    emit(GetAllMorningOrNightAzkarLoading());

    try {
      Box zikrBox;
      if (isMorningZikr) {
        zikrBox = await _hiveDB.openAndGetBox(boxName: morningAzkarHiveBox);
      } else {
        zikrBox = await _hiveDB.openAndGetBox(boxName: nightAzkarHiveBox);
      }

      emit(GetAllMorningOrNightAzkarLoaded(
          morningOrNightZikr:
              List<MorningOrNightZikr>.from(zikrBox.values.toList())));
    } catch (e) {
      emit(GetAllMorningOrNightAzkarError());
    }
  }
}

// class TestClassFormorningornightazkar {
//   static GetAllMorningOrNightAzkar({required bool isMorningZikr}) async {
//     try {
//       Box zikrBox;
//       if (isMorningZikr) {
//         zikrBox = await HiveDB().openAndGetBox(boxName: morningAzkarHiveBox);
//       } else {
//         zikrBox = await HiveDB().openAndGetBox(boxName: nightAzkarHiveBox);
//       }

//       for (var e in zikrBox.values) {
//         print(e);
//       }
//       print("here's a ll of them");
//     } catch (e) {}
//   }
// }
