import 'package:equatable/equatable.dart';

/// Domain entity representing a day's zikr records
/// Tracks how many times each zikr was performed on a specific day
class DayZikrRecordEntity extends Equatable {
  final String id;
  final DateTime dateTime;
  final Map<int, int> azkarRecordById; // Map of zikrId -> count

  const DayZikrRecordEntity({
    required this.id,
    required this.dateTime,
    required this.azkarRecordById,
  });

  @override
  List<Object?> get props => [id, dateTime, azkarRecordById];
}
