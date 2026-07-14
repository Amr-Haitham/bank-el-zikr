import 'package:equatable/equatable.dart';

class AdhkarProgressEntity extends Equatable {
  final String category;
  final DateTime? lastReadAt;
  final int completedCount;
  final int totalCount;

  const AdhkarProgressEntity({
    required this.category,
    this.lastReadAt,
    required this.completedCount,
    required this.totalCount,
  });

  double get progress =>
      totalCount == 0 ? 0 : (completedCount / totalCount).clamp(0, 1);

  bool get isCompleted => totalCount > 0 && completedCount >= totalCount;

  @override
  List<Object?> get props => [category, lastReadAt, completedCount, totalCount];
}
