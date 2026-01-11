import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/usecases/usecase.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/entities/situational_azkar_favorites.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/repositories/situational_azkar_repository.dart';

class GetFavorites implements UseCase<SituationalAzkarFavorites, NoParams> {
  final SituationalAzkarRepository repository;

  GetFavorites(this.repository);

  @override
  Future<RequestResult<SituationalAzkarFavorites>> call(NoParams params) async {
    return await repository.getFavorites();
  }
}
