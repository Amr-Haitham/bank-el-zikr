import 'package:bank_el_ziker/core/utils/safe_await.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../domain/entities/counter_state.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_datasource.dart';

/// Implementation of CounterRepository
/// Handles data operations and error handling using safeAwait
class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<CounterStateEntity>> getCounterState() async {
    return safeAwait(() async {
      final counterStateModel = await localDataSource.getCounterState();
      return counterStateModel.toEntity();
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
  Future<RequestResult<void>> updateCurrentZikr(int zikrId) async {
    return safeAwait(() async {
      final currentModel = await localDataSource.getCounterState();
      currentModel.currentZikrId = zikrId;
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
