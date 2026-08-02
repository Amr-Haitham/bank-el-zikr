import 'package:bank_el_ziker/features/home/data/models/prayer_model.dart';
import 'package:bank_el_ziker/features/home/data/models/prayer_mapper.dart';
import 'package:bank_el_ziker/features/settings/data/models/version_model.dart';
import 'package:bank_el_ziker/features/azkar_records/data/models/day_record_model.dart';
import 'package:bank_el_ziker/features/azkar_records/data/models/reading_progress_model.dart';
import 'package:bank_el_ziker/features/zikr_counter/data/models/general_data_model.dart';
import 'package:bank_el_ziker/core/data/models/zikr_model.dart';
import 'package:bank_el_ziker/core/data/models/zikr_mapper.dart';
import 'package:bank_el_ziker/core/constants/initial_data.dart';
import 'package:bank_el_ziker/core/constants/general_functions.dart';
import 'package:bank_el_ziker/core/layers/data/services/legacy_day_zikr_record_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bank_el_ziker/core/constants/version.dart';

const zikrHiveBox = "zikrHiveBox";
const customAzkarHiveBox = "customAzkarHiveBox";
const generalDataHiveBox = "generalDataHiveBox";
const dayRecordHiveBox = "dayRecordHiveBox";
const readingProgressHiveBox = "readingProgressHiveBox";
const prayerHiveBox = "prayerHiveBox";
const versionCheckHiveBox = "versionCheckHiveBox";

class HiveDB {
  static initHiveDB() async {
    await Hive.initFlutter();

    // register all classes
    Hive.registerAdapter<Zikr>(ZikrAdapter());
    Hive.registerAdapter<GeneralData>(GeneralDataAdapter());
    Hive.registerAdapter<DayRecord>(DayRecordAdapter());
    Hive.registerAdapter<ReadingProgress>(ReadingProgressAdapter());
    Hive.registerAdapter<Prayer>(PrayerAdapter());
    Hive.registerAdapter<Version>(VersionAdapter());
    Hive.registerAdapter<LegacyDayZikrRecord>(LegacyDayZikrRecordAdapter());
  }

  Future<Box<T>> openAndGetBox<T>({required String boxName}) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }
    try {
      return await Hive.openBox<T>(boxName);
    } catch (_) {
      // Box on disk is incompatible with the current schema (e.g. leftover
      // data from before a model change) — drop it and start fresh rather
      // than crashing on startup.
      await Hive.deleteBoxFromDisk(boxName);
      return await Hive.openBox<T>(boxName);
    }
  }

  /// Reads the pre-v11 "dayZikrRecordHiveBox" (Hive typeId 1, unregistered
  /// under the current adapter set) via a standalone box open so its data
  /// can be folded into the new [dayRecordHiveBox] before the old box is
  /// discarded. Returns an empty list if there's nothing there (fresh
  /// install, or an install that already migrated).
  Future<List<LegacyDayZikrRecord>> _readLegacyDayZikrRecords() async {
    const legacyBoxName = "dayZikrRecordHiveBox";
    if (!await Hive.boxExists(legacyBoxName)) return [];
    try {
      final box = await Hive.openBox<LegacyDayZikrRecord>(legacyBoxName);
      final records = box.values.toList();
      await box.close();
      await Hive.deleteBoxFromDisk(legacyBoxName);
      return records;
    } catch (_) {
      // Nothing usable to migrate — don't block startup over it.
      return [];
    }
  }

  Future<void> setupInitHiveDbDataIfNonExisting() async {
    var zikrBox = await openAndGetBox<Zikr>(boxName: zikrHiveBox);
    await openAndGetBox<Zikr>(boxName: customAzkarHiveBox);
    var generalDataBox =
        await openAndGetBox<GeneralData>(boxName: generalDataHiveBox);
    var dayRecordBox = await openAndGetBox<DayRecord>(boxName: dayRecordHiveBox);
    await openAndGetBox<ReadingProgress>(boxName: readingProgressHiveBox);
    var prayerAzkarBox = await openAndGetBox<Prayer>(boxName: prayerHiveBox);
    var versionBox = await openAndGetBox<Version>(boxName: versionCheckHiveBox);

    final allSeedZikr = [
      ...InitialData.generalAzkar,
      ...InitialData.morningAzkar,
      ...InitialData.nightAzkar,
      ...InitialData.conditionAzkar,
      ...InitialData.ruqyahAzkar,
      ...InitialData.afterPrayerAzkar,
    ];

    if (versionBox.isEmpty ||
        (versionBox.values.first.currentVersion != ReleaseVersion.version)) {
      // Build the old-int-id -> new-key mapping from whatever built-in Zikr
      // content is currently on disk, before it gets cleared below. Matched
      // by content string (position/id in the old box isn't a reliable
      // guide once content has changed across releases).
      final Map<int, String> oldIdToNewKey = {};
      if (zikrBox.isNotEmpty) {
        final contentToNewKey = <String, String>{
          for (final entity in allSeedZikr) entity.content: entity.key,
        };
        for (final oldZikr in zikrBox.values) {
          final newKey = contentToNewKey[oldZikr.content];
          if (newKey != null) {
            oldIdToNewKey[oldZikr.id] = newKey;
          }
        }
      }

      // Preserve accountBalance/currentCounter, repoint currentZikrKey.
      if (generalDataBox.isNotEmpty) {
        final generalData = generalDataBox.values.first;
        final accountBalance = generalData.accountBalance;
        final currentCounter = generalData.currentCounter;

        await generalDataBox.clear();
        await generalDataBox.put(
            "generalData",
            GeneralData(
                currentZikrKey: allSeedZikr.first.key,
                currentCounter: currentCounter,
                currentGoal: null,
                accountBalance: accountBalance));
      }

      // Fold the old 7-day rolling history into the new unbounded DayRecord
      // box, remapping int zikr ids to the new stable keys. Entries with no
      // mapping (content that no longer exists) are dropped rather than
      // crashing the migration.
      final legacyRecords = await _readLegacyDayZikrRecords();
      for (final legacy in legacyRecords) {
        final Map<String, int> repsByZikrKey = {};
        for (final entry in legacy.azkarRecordById.entries) {
          final newKey = oldIdToNewKey[entry.key];
          if (newKey != null) {
            repsByZikrKey[newKey] = (repsByZikrKey[newKey] ?? 0) + entry.value;
          }
        }
        final dayDate = DateTime(
            legacy.dateTime.year, legacy.dateTime.month, legacy.dateTime.day);
        final id = dateIdGenerator(dayDate);
        final existing = dayRecordBox.get(id);
        if (existing != null) {
          final merged = Map<String, int>.from(existing.repsByZikrKey);
          for (final entry in repsByZikrKey.entries) {
            merged[entry.key] = (merged[entry.key] ?? 0) + entry.value;
          }
          existing.repsByZikrKey = merged;
          await dayRecordBox.put(id, existing);
        } else if (repsByZikrKey.isNotEmpty) {
          await dayRecordBox.put(
              id,
              DayRecord(
                  id: id, date: dayDate, repsByZikrKey: repsByZikrKey));
        }
      }

      await versionBox.clear();
      await versionBox.add(Version(currentVersion: ReleaseVersion.version));

      await zikrBox.clear();
    }

    if (zikrBox.isEmpty) {
      await zikrBox.addAll(allSeedZikr.map((e) => ZikrMapper.toModel(e)));
    }
    if (prayerAzkarBox.isEmpty) {
      await prayerAzkarBox
          .addAll(InitialData.prayers.map((e) => PrayerMapper.toModel(e)));
    }

    if (generalDataBox.isEmpty) {
      await generalDataBox.put(
          "generalData",
          GeneralData(
              currentZikrKey: allSeedZikr.first.key,
              currentCounter: 0,
              currentGoal: null,
              accountBalance: 0));
    }
  }
}
