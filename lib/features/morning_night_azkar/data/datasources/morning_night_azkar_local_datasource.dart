import 'package:bank_el_ziker/features/morning_night_azkar/data/models/morning_night_zikr_model.dart';
import 'package:hive/hive.dart';

abstract class MorningNightAzkarLocalDataSource {
  Future<List<MorningNightZikrModel>> getMorningAzkar();
  Future<List<MorningNightZikrModel>> getNightAzkar();
}

class MorningNightAzkarLocalDataSourceImpl
    implements MorningNightAzkarLocalDataSource {
  final Box<MorningNightZikrModel> morningAzkarBox;
  final Box<MorningNightZikrModel> nightAzkarBox;

  MorningNightAzkarLocalDataSourceImpl({
    required this.morningAzkarBox,
    required this.nightAzkarBox,
  });

  @override
  Future<List<MorningNightZikrModel>> getMorningAzkar() async {
    return morningAzkarBox.values.toList();
  }

  @override
  Future<List<MorningNightZikrModel>> getNightAzkar() async {
    return nightAzkarBox.values.toList();
  }
}
