import 'package:bank_el_ziker/features/engagement/data/models/rate_prompt_state_model.dart';
import 'package:bank_el_ziker/features/engagement/domain/entities/rate_prompt_state.dart';

class RatePromptStateMapper {
  static RatePromptStateEntity toEntity(RatePromptState model) {
    return RatePromptStateEntity(
      lastShownAt: model.lastShownAt,
      timesShown: model.timesShown,
    );
  }

  static RatePromptState toModel(RatePromptStateEntity entity) {
    return RatePromptState(
      lastShownAt: entity.lastShownAt,
      timesShown: entity.timesShown,
    );
  }
}
