import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/usecases/usecase.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/repositories/situational_azkar_repository.dart';
import 'package:equatable/equatable.dart';

class ToggleFavorite implements UseCase<void, ToggleFavoriteParams> {
  final SituationalAzkarRepository repository;

  ToggleFavorite(this.repository);

  @override
  Future<RequestResult<void>> call(ToggleFavoriteParams params) async {
    return await repository.toggleFavorite(params.zikrId);
  }
}

class ToggleFavoriteParams extends Equatable {
  final int zikrId;

  const ToggleFavoriteParams({required this.zikrId});

  @override
  List<Object?> get props => [zikrId];
}
