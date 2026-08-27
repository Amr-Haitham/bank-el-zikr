import 'package:equatable/equatable.dart';

/// A single day's worth of spiritual-activity data, kept indefinitely so
/// that real streaks, "longest streak", and month/year history can be
/// computed. Single source of truth for the graph, streaks, and journey
/// data — replaces the old DayZikrRecordEntity (7-day rolling) and
/// DailyActivityEntry (unbounded) which duplicated each other.
class DayRecordEntity extends Equatable {
  final String id;
  final DateTime date;
  final Map<String, int> repsByZikrKey;
  final bool morningCompleted;
  final bool eveningCompleted;
  final bool sleepCompleted;

  const DayRecordEntity({
    required this.id,
    required this.date,
    required this.repsByZikrKey,
    required this.morningCompleted,
    required this.eveningCompleted,
    required this.sleepCompleted,
  });

  int get totalZikrCount => repsByZikrKey.values.fold(0, (a, b) => a + b);

  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool get isActive =>
      totalZikrCount > 0 ||
      morningCompleted ||
      eveningCompleted ||
      sleepCompleted;

  DayRecordEntity copyWith({
    Map<String, int>? repsByZikrKey,
    bool? morningCompleted,
    bool? eveningCompleted,
    bool? sleepCompleted,
  }) {
    return DayRecordEntity(
      id: id,
      date: date,
      repsByZikrKey: repsByZikrKey ?? this.repsByZikrKey,
      morningCompleted: morningCompleted ?? this.morningCompleted,
      eveningCompleted: eveningCompleted ?? this.eveningCompleted,
      sleepCompleted: sleepCompleted ?? this.sleepCompleted,
    );
  }

  @override
  List<Object?> get props => [
        id,
        date,
        repsByZikrKey,
        morningCompleted,
        eveningCompleted,
        sleepCompleted,
      ];
}
