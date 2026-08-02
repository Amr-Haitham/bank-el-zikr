import 'package:hive/hive.dart';
part 'reading_progress_model.g.dart';

@HiveType(typeId: 7)
class ReadingProgress extends HiveObject {
  ReadingProgress({
    required this.category,
    required this.date,
    this.lastReadAt,
    required this.completedCount,
    required this.totalCount,
    required this.repsByZikrKey,
  });

  @HiveField(0)
  String category;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  DateTime? lastReadAt;

  @HiveField(3)
  int completedCount;

  @HiveField(4)
  int totalCount;

  @HiveField(5)
  Map<String, int> repsByZikrKey;
}
