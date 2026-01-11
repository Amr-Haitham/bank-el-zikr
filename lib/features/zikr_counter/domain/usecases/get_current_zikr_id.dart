import 'package:dartz/dartz.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../repositories/counter_repository.dart';

/// Use case for getting just the current zikr ID
/// (Convenience use case to match the old GetCurrentZikrCubit functionality)
class GetCurrentZikrId implements UseCase<int, NoParams> {
  final CounterRepository repository;

  GetCurrentZikrId(this.repository);

  @override
  Future<RequestResult<int>> call(NoParams params) async {
    final result = await repository.getCounterState();
    return result.fold(
      (failure) => Left(failure),
      (counterState) => Right(counterState.currentZikrId),
    );
  }
}
