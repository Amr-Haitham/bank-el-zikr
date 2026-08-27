import 'package:equatable/equatable.dart';

class RatePromptStateEntity extends Equatable {
  static const int maxTimesShown = 3;
  static const int minCompletedSessionsToTrigger = 5;
  static const Duration cooldown = Duration(days: 90);

  final DateTime? lastShownAt;
  final int timesShown;

  const RatePromptStateEntity({
    this.lastShownAt,
    this.timesShown = 0,
  });

  bool isEligible({
    required int totalCompletedSessions,
    required DateTime now,
  }) {
    if (totalCompletedSessions < minCompletedSessionsToTrigger) return false;
    if (timesShown >= maxTimesShown) return false;
    if (lastShownAt == null) return true;
    return now.difference(lastShownAt!) >= cooldown;
  }

  RatePromptStateEntity copyWith({
    DateTime? lastShownAt,
    int? timesShown,
  }) {
    return RatePromptStateEntity(
      lastShownAt: lastShownAt ?? this.lastShownAt,
      timesShown: timesShown ?? this.timesShown,
    );
  }

  @override
  List<Object?> get props => [lastShownAt, timesShown];
}
