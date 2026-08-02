import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../domain/entities/counter_state.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_datasource.dart';
import '../models/general_data_mapper.dart';

/// Implementation of CounterRepository
/// Handles data operations and error handling using safeAwait
class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<CounterStateEntity>> getCounterState() async {
    return safeAwait(() async {
      final counterStateModel = await localDataSource.getCounterState();
      return GeneralDataMapper.toEntity(counterStateModel);
    });
  }

  @override
  Future<RequestResult<void>> updateCounter(int counter) async {
    return safeAwait(() async {
      // Get current state
      final currentModel = await localDataSource.getCounterState();

      // Update counter field
      currentModel.currentCounter = counter;

      // Save back to storage
      await localDataSource.updateCounterState(currentModel);
    });
  }

  @override
  Future<RequestResult<void>> updateCurrentZikr(String zikrKey) async {
    return safeAwait(() async {
      final currentModel = await localDataSource.getCounterState();
      currentModel.currentZikrKey = zikrKey;
      await localDataSource.updateCounterState(currentModel);
    });
  }

  @override
  Future<RequestResult<void>> updateGoal(int? goal) async {
    return safeAwait(() async {
      final currentModel = await localDataSource.getCounterState();
      currentModel.currentGoal = goal;
      await localDataSource.updateCounterState(currentModel);
    });
  }

  @override
  Future<RequestResult<void>> incrementAccountBalance() async {
    return safeAwait(() async {
      final currentModel = await localDataSource.getCounterState();
      currentModel.accountBalance++;
      await localDataSource.updateCounterState(currentModel);
    });
  }
}
