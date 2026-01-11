import 'package:bank_el_ziker/features/morning_night_azkar/data/models/morning_night_zikr_model.dart';
import 'package:bank_el_ziker/features/home/data/models/prayer_model.dart';
import 'package:bank_el_ziker/features/settings/data/models/version_model.dart';
import 'package:bank_el_ziker/features/azkar_records/data/models/day_zikr_record_model.dart';
import 'package:bank_el_ziker/features/zikr_counter/data/models/general_data_model.dart';
import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';
import 'package:bank_el_ziker/core/constants/initial_data.dart';
import 'package:bank_el_ziker/core/constants/general_functions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bank_el_ziker/core/constants/version.dart';

const zikrHiveBox = "zikrHiveBox";
const customAzkarHiveBox = "customAzkarHiveBox";
const generalDataHiveBox = "generalDataHiveBox";
const dayZikrRecordHiveBox = "dayZikrRecordHiveBox";
const morningAzkarHiveBox = "morningAzkarBox";
const nightAzkarHiveBox = "nightAzkarBox";
const conditionalAzkarHiveBox = "conditionalAzkarHiveBox";
const prayerHiveBox = "prayerHiveBox";
const versionCheckHiveBox = "versionCheckHiveBox";

class HiveDB {
  static initHiveDB() async {
    await Hive.initFlutter();

    // register all classes
    Hive.registerAdapter<Zikr>(ZikrAdapter());
    Hive.registerAdapter<GeneralData>(GeneralDataAdapter());
    Hive.registerAdapter<DayZikrRecord>(DayZikrRecordAdapter());
    Hive.registerAdapter<MorningOrNightZikr>(MorningOrNightZikrAdapter());
    Hive.registerAdapter<Prayer>(PrayerAdapter());
    Hive.registerAdapter<Version>(VersionAdapter());
  }

  Future<Box> openAndGetBox({required boxName}) async {
    if (!(Hive.isBoxOpen(boxName))) {
      return await Hive.openBox(boxName);
    } else {
      return Hive.box(boxName);
    }
  }

  Future<void> setupInitHiveDbDataIfNonExisting() async {
    var zikrBox = await openAndGetBox(boxName: zikrHiveBox);
    var generalDataBox = await openAndGetBox(boxName: generalDataHiveBox);
    var dayZikrRecordBox = await openAndGetBox(boxName: dayZikrRecordHiveBox);
    var morningAzkarBox = await openAndGetBox(boxName: morningAzkarHiveBox);
    var nightAzkarBox = await openAndGetBox(boxName: nightAzkarHiveBox);
    var prayerAzkarBox = await openAndGetBox(boxName: prayerHiveBox);
    var conditionalAzkarBox =
        await openAndGetBox(boxName: conditionalAzkarHiveBox);
    var versionBox = await openAndGetBox(boxName: versionCheckHiveBox);

    if (versionBox.isEmpty ||
        (versionBox.values.first.currentVersion != ReleaseVersion.version)) {
      await versionBox.clear();
      await versionBox.add(Version(currentVersion: ReleaseVersion.version));

      await morningAzkarBox.clear();
      await nightAzkarBox.clear();
      await conditionalAzkarBox.clear();

      if ((generalDataBox.isNotEmpty)) {
        GeneralData generalData = generalDataBox.values.first;

        int accountBalance = generalData.accountBalance;
        int currentCounter = generalData.currentCounter;

        await generalDataBox.clear();

        await generalDataBox.put(
            "generalData",
            GeneralData(
                currentZikrId: InitialData.generalAzkar.first.id,
                currentCounter: currentCounter,
                currentGoal: null,
                accountBalance: accountBalance));
      }
    }

    if (zikrBox.isEmpty) {
      await zikrBox.addAll(InitialData.generalAzkar);
    }
    if (morningAzkarBox.isEmpty) {
      await morningAzkarBox.addAll(InitialData.morningAzkar);
    }
    if (nightAzkarBox.isEmpty) {
      await nightAzkarBox.addAll(InitialData.nightAzkar);
    }
    if (prayerAzkarBox.isEmpty) {
      await prayerAzkarBox.addAll(InitialData.prayers);
    }
    if (conditionalAzkarBox.isEmpty) {
      await conditionalAzkarBox.addAll(InitialData.conditionAzkar);
    }

    if (generalDataBox.isEmpty) {
      await generalDataBox.put(
          "generalData",
          GeneralData(
              currentZikrId: InitialData.generalAzkar.first.id,
              currentCounter: 0,
              currentGoal: null,
              accountBalance: 0));
    }
    if (dayZikrRecordBox.isEmpty) {
      DateTime dateTimeNow = DateTime.now();
      DateTime dateTime =
          DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
      for (var i = 0; i < 7; i++) {
        var d = dateTime.subtract(Duration(days: i));
        await dayZikrRecordBox.add(DayZikrRecord(
            id: dateIdGenerator(d), dateTime: d, azkarRecordById: {}));
      }
    }
  }
}
