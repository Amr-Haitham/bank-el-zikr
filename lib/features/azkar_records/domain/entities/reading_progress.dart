import 'package:equatable/equatable.dart';

/// Per-category resume state for the adhkar reading screen — which zikr in
/// this category's list was last read, and when. Resets every calendar day
/// (see [date]): unlike [DayRecordEntity], this is not history, it's a
/// checkpoint that only makes sense for the current day.
class ReadingProgressEntity extends Equatable {
  final String category;
  final DateTime date;
  final DateTime? lastReadAt;
  final int completedCount;
  final int totalCount;
  final Map<String, int> repsByZikrKey;

  const ReadingProgressEntity({
    required this.category,
    required this.date,
    this.lastReadAt,
    required this.completedCount,
    required this.totalCount,
    this.repsByZikrKey = const {},
  });

  double get progress =>
      totalCount == 0 ? 0 : (completedCount / totalCount).clamp(0, 1);

  bool get isCompleted => totalCount > 0 && completedCount >= totalCount;

  ReadingProgressEntity copyWith({
    String? category,
    DateTime? date,
    DateTime? lastReadAt,
    int? completedCount,
    int? totalCount,
    Map<String, int>? repsByZikrKey,
  }) {
    return ReadingProgressEntity(
      category: category ?? this.category,
      date: date ?? this.date,
      lastReadAt: lastReadAt ?? this.lastReadAt,
      completedCount: completedCount ?? this.completedCount,
      totalCount: totalCount ?? this.totalCount,
      repsByZikrKey: repsByZikrKey ?? this.repsByZikrKey,
    );
  }

  @override
  List<Object?> get props =>
      [category, date, lastReadAt, completedCount, totalCount, repsByZikrKey];
}
