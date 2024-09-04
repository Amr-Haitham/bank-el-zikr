import 'package:bank_el_ziker/3_data/models/morning_or_night_zikr.dart';
import 'package:bank_el_ziker/3_data/models/prayer.dart';
import 'package:bank_el_ziker/1_ui/core/consts/general_functions.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/release_version.dart';
import '../models/version.dart';
import '../models/day_zikr_record.dart';
import '../models/general_data.dart';
import '../models/zikr.dart';
import '../../1_ui/core/consts/initial_data.dart';

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

    //register all classes
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

      // print('made update');
      // await zikrBox.clear();
      // await morningAzkarBox.clear();
      // await nightAzkarBox.clear();
      // await prayerAzkarBox.clear();
      // await conditionalAzkarBox.clear();
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

  // void printDB() async {
  //   var zikrBox = await openAndGetBox(boxName: zikrHiveBox);
  //   var generalDataBox = await openAndGetBox(boxName: generalDataHiveBox);
  //   var dayZikrRecordBox = await openAndGetBox(boxName: dayZikrRecordHiveBox);

  //   for (Zikr zikr in zikrBox.values) {
  //     print("${zikr.id} ${zikr.content}");
  //   }
  //   GeneralData g = generalDataBox.values.first;
  //   print(g.accountBalance);
  //   print(g.currentCounter);
  //   print(g.currentGoal);
  //   print(g.currentZikrId);

  //   for (DayZikrRecord dayRecord in dayZikrRecordBox.values) {
  //     print(dayRecord.dateTime.toString());
  //     print(dayRecord.azkarRecordById);
  //   }
  // }
}
