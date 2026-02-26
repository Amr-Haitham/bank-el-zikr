import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/usecases/toggle_favorite.dart';

class ToggleFavoriteCubit extends RequestCubit<void> {
  final ToggleFavorite toggleFavorite;

  ToggleFavoriteCubit({
    required this.toggleFavorite,
  }) : super();

  Future<void> executeToggle(int zikrId) async {
    execute(
        request: () => toggleFavorite(ToggleFavoriteParams(zikrId: zikrId)));
  }
}
