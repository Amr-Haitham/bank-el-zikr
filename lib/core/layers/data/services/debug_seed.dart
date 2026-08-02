import 'package:bank_el_ziker/core/constants/general_functions.dart';
import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';
import 'package:bank_el_ziker/features/azkar_records/data/models/day_record_model.dart';
import 'package:bank_el_ziker/features/home/data/models/prayer_model.dart';
import 'package:bank_el_ziker/features/zikr_counter/data/models/general_data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Dev-only helper to populate Hive with sample data (balance, streak) so the
/// Home screen can be visually checked against design mocks. Call manually
/// from main() under kDebugMode — never runs in release builds. Not part of
/// the real seed path in [HiveDB.setupInitHiveDbDataIfNonExisting].
Future<void> seedDebugHomeData() async {
  final generalDataBox = await Hive.openBox<GeneralData>(generalDataHiveBox);
  await generalDataBox.clear();
  await generalDataBox.put(
    "generalData",
    GeneralData(
      currentZikrKey: 'general_001',
      currentCounter: 0,
      currentGoal: null,
      accountBalance: 14850,
    ),
  );

  final dayRecordBox = await Hive.openBox<DayRecord>(dayRecordHiveBox);
  await dayRecordBox.clear();
  final today = DateTime.now();
  final todayOnly = DateTime(today.year, today.month, today.day);
  for (var i = 0; i < 12; i++) {
    final d = todayOnly.subtract(Duration(days: i));
    final id = dateIdGenerator(d);
    await dayRecordBox.put(
      id,
      DayRecord(
        id: id,
        date: d,
        repsByZikrKey: {'general_001': i == 0 ? 320 : 50},
      ),
    );
  }

  // TODO revert: forces the verse-of-the-day card to always show the one
  // seeded entry with transliteration/translation/reference, so the rich
  // layout is visible without relying on the 1-in-43 random pick.
  final prayerBox = await Hive.openBox<Prayer>(prayerHiveBox);
  await prayerBox.clear();
  await prayerBox.add(Prayer(
    id: 43,
    content: "أَلَا بِذِكْرِ اللَّهِ تَطْمَئِنُّ الْقُلُوبُ",
    transliteration: "Alā bidhikrillāhi taṭma'innul-qulūb.",
    translation: "Verily, in the remembrance of Allah do hearts find rest.",
    reference: "الرعد ٢٨",
  ));
}
