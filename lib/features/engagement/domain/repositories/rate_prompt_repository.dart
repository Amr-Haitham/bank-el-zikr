import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/features/engagement/domain/entities/rate_prompt_state.dart';

abstract class RatePromptRepository {
  Future<RequestResult<RatePromptStateEntity>> getState();
  Future<RequestResult<void>> saveState(RatePromptStateEntity state);
}
