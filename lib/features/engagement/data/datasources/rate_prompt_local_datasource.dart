import 'package:hive/hive.dart';
import 'package:bank_el_ziker/features/engagement/data/models/rate_prompt_state_model.dart';

abstract class RatePromptLocalDataSource {
  Future<RatePromptState> getState();
  Future<void> saveState(RatePromptState state);
}

class RatePromptLocalDataSourceImpl implements RatePromptLocalDataSource {
  final Box<RatePromptState> box;

  static const String _key = 'ratePromptState';

  RatePromptLocalDataSourceImpl({required this.box});

  @override
  Future<RatePromptState> getState() async {
    return box.get(_key) ?? RatePromptState();
  }

  @override
  Future<void> saveState(RatePromptState state) async {
    await box.put(_key, state);
  }
}
