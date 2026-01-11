import 'dart:math';
import 'package:bank_el_ziker/features/home/data/models/prayer_model.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  Future<PrayerModel> getRandomPrayer();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box<PrayerModel> prayerBox;

  HomeLocalDataSourceImpl({required this.prayerBox});

  @override
  Future<PrayerModel> getRandomPrayer() async {
    final prayers = prayerBox.values.toList();

    if (prayers.isEmpty) {
      throw Exception('No prayers available');
    }

    final random = Random();
    final randomIndex = random.nextInt(prayers.length);
    return prayers[randomIndex];
  }
}
