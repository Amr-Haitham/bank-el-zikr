import 'package:hive/hive.dart';
part 'legacy_day_zikr_record_model.g.dart';

/// Read-only shape of the pre-v11 DayZikrRecord model (Hive typeId 1),
/// kept solely so the version-11 migration in [HiveDB] can read existing
/// users' old 7-day rolling history and fold it into the new DayRecord box.
/// Not used anywhere outside that one-time migration — safe to delete once
/// the app has shipped long enough that no installs still carry old data.
@HiveType(typeId: 1)
class LegacyDayZikrRecord extends HiveObject {
  LegacyDayZikrRecord({
    required this.id,
    required this.dateTime,
    required this.azkarRecordById,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime dateTime;

  @HiveField(2)
  Map<int, int> azkarRecordById;
}
