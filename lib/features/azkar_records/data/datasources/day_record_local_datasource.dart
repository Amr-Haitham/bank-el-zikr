import 'package:hive/hive.dart';
import 'package:bank_el_ziker/features/azkar_records/data/models/day_record_model.dart';

abstract class DayRecordLocalDataSource {
  Future<List<DayRecord>> getAll();
  Future<void> logZikrIncrement({required String zikrKey, required DateTime date});
  Future<void> markCategoryCompleted({required String category, required DateTime date});
  Future<void> deleteZikrRecord(String zikrKey);
}

class DayRecordLocalDataSourceImpl implements DayRecordLocalDataSource {
  final Box<DayRecord> box;

  DayRecordLocalDataSourceImpl({required this.box});

  static String _dateKey(DateTime date) {
    final d = DateTime(date.year, date.month, date.day);
    return "${d.year.toString().padLeft(4, '0')}-"
        "${d.month.toString().padLeft(2, '0')}-"
        "${d.day.toString().padLeft(2, '0')}";
  }

  DayRecord _findOrCreate(DateTime date) {
    final key = _dateKey(date);
    final existing = box.get(key);
    if (existing != null) return existing;
    return DayRecord(
      id: key,
      date: DateTime(date.year, date.month, date.day),
      repsByZikrKey: const {},
    );
  }

  @override
  Future<List<DayRecord>> getAll() async {
    final records = box.values.toList();
    records.sort((a, b) => b.date.compareTo(a.date));
    return records;
  }

  @override
  Future<void> logZikrIncrement({
    required String zikrKey,
    required DateTime date,
  }) async {
    final record = _findOrCreate(date);
    final reps = Map<String, int>.from(record.repsByZikrKey);
    reps[zikrKey] = (reps[zikrKey] ?? 0) + 1;
    record.repsByZikrKey = reps;
    await box.put(record.id, record);
  }

  @override
  Future<void> markCategoryCompleted({
    required String category,
    required DateTime date,
  }) async {
    final record = _findOrCreate(date);
    switch (category) {
      case 'morning':
        record.morningCompleted = true;
        break;
      case 'evening':
        record.eveningCompleted = true;
        break;
      case 'sleep':
        record.sleepCompleted = true;
        break;
    }
    await box.put(record.id, record);
  }

  @override
  Future<void> deleteZikrRecord(String zikrKey) async {
    for (final record in box.values.toList()) {
      if (record.repsByZikrKey.containsKey(zikrKey)) {
        final reps = Map<String, int>.from(record.repsByZikrKey);
        reps.remove(zikrKey);
        record.repsByZikrKey = reps;
        await box.put(record.id, record);
      }
    }
  }
}
