import 'package:bank_el_ziker/features/morning_night_azkar/data/models/morning_night_zikr_model.dart';
import 'package:hive/hive.dart';

abstract class MorningNightAzkarLocalDataSource {
  Future<List<MorningOrNightZikr>> getMorningAzkar();
  Future<List<MorningOrNightZikr>> getNightAzkar();
}

class MorningNightAzkarLocalDataSourceImpl
    implements MorningNightAzkarLocalDataSource {
  final Box<MorningOrNightZikr> morningAzkarBox;
  final Box<MorningOrNightZikr> nightAzkarBox;

  MorningNightAzkarLocalDataSourceImpl({
    required this.morningAzkarBox,
    required this.nightAzkarBox,
  });

  @override
  Future<List<MorningOrNightZikr>> getMorningAzkar() async {
    return morningAzkarBox.values.toList();
  }

  @override
  Future<List<MorningOrNightZikr>> getNightAzkar() async {
    return nightAzkarBox.values.toList();
  }
}
