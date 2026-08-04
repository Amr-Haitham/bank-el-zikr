import 'package:dartz/dartz.dart';
import '../../../../core/constants/type_definitions.dart';
import '../../../../core/layers/domain/usecases/usecase.dart';
import '../repositories/counter_repository.dart';

/// Use case for getting just the current zikr key
/// (Convenience use case to match the old GetCurrentZikrCubit functionality)
class GetCurrentZikrKey implements UseCase<String, NoParams> {
  final CounterRepository repository;

  GetCurrentZikrKey(this.repository);

  @override
  Future<RequestResult<String>> call(NoParams params) async {
    final result = await repository.getCounterState();
    return result.fold(
      (failure) => Left(failure),
      (counterState) => Right(counterState.currentZikrKey),
    );
  }
}
