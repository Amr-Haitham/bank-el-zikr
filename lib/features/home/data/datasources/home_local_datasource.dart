import 'dart:math';
import 'package:hive/hive.dart';
import 'package:bank_el_ziker/features/home/data/models/prayer_model.dart';

abstract class HomeLocalDataSource {
  Future<Prayer> getRandomPrayer();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box<Prayer> prayerBox;

  HomeLocalDataSourceImpl({required this.prayerBox});

  @override
  Future<Prayer> getRandomPrayer() async {
    final prayers = prayerBox.values.toList();

    if (prayers.isEmpty) {
      throw Exception('No prayers available');
    }

    final random = Random();
    final randomIndex = random.nextInt(prayers.length);
    return prayers[randomIndex];
  }
}
