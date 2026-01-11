import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/usecases/get_favorites.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/usecases/get_situational_azkar.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/usecases/toggle_favorite.dart';

class SituationalAzkarCubit extends RequestCubit<List<Zikr>> {
  final GetSituationalAzkar getSituationalAzkar;
  final GetFavorites getFavorites;
  final ToggleFavorite toggleFavorite;

  List<int> _favoriteIds = [];
  List<int> get favoriteIds => _favoriteIds;

  SituationalAzkarCubit({
    required this.getSituationalAzkar,
    required this.getFavorites,
    required this.toggleFavorite,
  }) : super(
          callOnCreate: true,
          request: () => getSituationalAzkar(const NoParams()),
        );

  Future<void> loadFavorites() async {
    final result = await getFavorites(const NoParams());
    result.fold(
      (failure) => null,
      (favorites) => _favoriteIds = favorites.favoriteIds,
    );
  }

  Future<void> toggleFavoriteZikr(int zikrId) async {
    final result = await toggleFavorite(ToggleFavoriteParams(zikrId: zikrId));
    result.fold(
      (failure) => null,
      (_) async {
        await loadFavorites();
      },
    );
  }

  bool isFavorite(int zikrId) {
    return _favoriteIds.contains(zikrId);
  }
}
