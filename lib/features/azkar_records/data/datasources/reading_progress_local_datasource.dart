import 'package:hive/hive.dart';
import 'package:bank_el_ziker/features/azkar_records/data/models/reading_progress_model.dart';

abstract class ReadingProgressLocalDataSource {
  Future<Map<String, ReadingProgress>> getAllProgress();
  Future<void> saveProgress(ReadingProgress progress);
}

class ReadingProgressLocalDataSourceImpl
    implements ReadingProgressLocalDataSource {
  final Box<ReadingProgress> box;

  ReadingProgressLocalDataSourceImpl({required this.box});

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  @override
  Future<Map<String, ReadingProgress>> getAllProgress() async {
    final result = <String, ReadingProgress>{};
    for (final entry in box.toMap().entries) {
      final progress = entry.value;
      if (_isToday(progress.date)) {
        result[progress.category] = progress;
      }
    }
    return result;
  }

  @override
  Future<void> saveProgress(ReadingProgress progress) async {
    await box.put(progress.category, progress);
  }
}
