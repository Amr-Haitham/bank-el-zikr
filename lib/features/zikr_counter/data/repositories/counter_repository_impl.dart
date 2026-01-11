import 'package:dartz/dartz.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/data/failure/failure.dart';
import '../../domain/entities/counter_state.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_datasource.dart';

/// Implementation of CounterRepository
/// Handles data operations and error handling using RequestResult pattern
class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl({required this.localDataSource});

  @override
  Future<RequestResult<CounterState>> getCounterState() async {
    try {
      final counterStateModel = await localDataSource.getCounterState();
      return Right(counterStateModel.toEntity());
    } catch (e) {
      return Left(Failure(
        message: 'Failed to get counter state: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> updateCounter(int counter) async {
    try {
      // Get current state
      final currentModel = await localDataSource.getCounterState();

      // Update counter field
      currentModel.currentCounter = counter;

      // Save back to storage
      await localDataSource.updateCounterState(currentModel);

      return const Right(null);
    } catch (e) {
      return Left(Failure(
        message: 'Failed to update counter: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> updateCurrentZikr(int zikrId) async {
    try {
      final currentModel = await localDataSource.getCounterState();
      currentModel.currentZikrId = zikrId;
      await localDataSource.updateCounterState(currentModel);
      return const Right(null);
    } catch (e) {
      return Left(Failure(
        message: 'Failed to update current zikr: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> updateGoal(int? goal) async {
    try {
      final currentModel = await localDataSource.getCounterState();
      currentModel.currentGoal = goal;
      await localDataSource.updateCounterState(currentModel);
      return const Right(null);
    } catch (e) {
      return Left(Failure(
        message: 'Failed to update goal: ${e.toString()}',
      ));
    }
  }

  @override
  Future<RequestResult<void>> incrementAccountBalance() async {
    try {
      final currentModel = await localDataSource.getCounterState();
      currentModel.accountBalance++;
      await localDataSource.updateCounterState(currentModel);
      return const Right(null);
    } catch (e) {
      return Left(Failure(
        message: 'Failed to increment account balance: ${e.toString()}',
      ));
    }
  }
}
