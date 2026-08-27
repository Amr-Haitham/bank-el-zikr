import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/utils/safe_await.dart';
import 'package:bank_el_ziker/features/engagement/data/datasources/rate_prompt_local_datasource.dart';
import 'package:bank_el_ziker/features/engagement/data/models/rate_prompt_state_mapper.dart';
import 'package:bank_el_ziker/features/engagement/domain/entities/rate_prompt_state.dart';
import 'package:bank_el_ziker/features/engagement/domain/repositories/rate_prompt_repository.dart';

class RatePromptRepositoryImpl implements RatePromptRepository {
  final RatePromptLocalDataSource localDataSource;

  RatePromptRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<RatePromptStateEntity>> getState() async {
    return safeAwait(() async {
      final model = await localDataSource.getState();
      return RatePromptStateMapper.toEntity(model);
    });
  }

  @override
  Future<RequestResult<void>> saveState(RatePromptStateEntity state) async {
    return safeAwait(() async {
      await localDataSource.saveState(RatePromptStateMapper.toModel(state));
    });
  }
}
