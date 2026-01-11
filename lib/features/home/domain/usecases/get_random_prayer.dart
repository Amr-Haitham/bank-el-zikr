import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/usecases/usecase.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:bank_el_ziker/features/home/domain/repositories/home_repository.dart';

class GetRandomPrayer implements UseCase<Prayer, NoParams> {
  final HomeRepository repository;

  GetRandomPrayer(this.repository);

  @override
  Future<RequestResult<Prayer>> call(NoParams params) async {
    return await repository.getRandomPrayer();
  }
}
