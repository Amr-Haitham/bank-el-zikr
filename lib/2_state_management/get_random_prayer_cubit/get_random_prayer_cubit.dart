import 'dart:math';
import 'package:bank_el_ziker/3_data/models/prayer.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../3_data/services/hive_db.dart';
part 'get_random_prayer_state.dart';

class GetRandomPrayerCubit extends Cubit<GetRandomPrayerState> {
  GetRandomPrayerCubit() : super(GetRandomPrayerInitial());
  final HiveDB _hiveDB = HiveDB();

  Prayer? _getRandomPrayer(List<Prayer> list) {
    if (list.isEmpty) return null; // Return null if the list is empty
    final random = Random();
    final randomIndex = random.nextInt(list.length);
    return list[randomIndex];
  }

  void getPrayer() async {
    emit(GetRandomPrayerLoading());
    try {
      Box prayerBox = await _hiveDB.openAndGetBox(boxName: prayerHiveBox);
      Prayer prayer = _getRandomPrayer(List<Prayer>.from(prayerBox.values))!;
      emit(GetRandomPrayerLoaded(prayer: prayer));
    } catch (e) {
      emit(GetRandomPrayerError());
    }
  }
}
