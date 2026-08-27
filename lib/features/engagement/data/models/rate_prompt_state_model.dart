import 'package:hive_flutter/hive_flutter.dart';

part 'rate_prompt_state_model.g.dart';

@HiveType(typeId: 8)
class RatePromptState {
  @HiveField(0)
  final DateTime? lastShownAt;
  @HiveField(1)
  final int timesShown;

  RatePromptState({
    this.lastShownAt,
    this.timesShown = 0,
  });
}
