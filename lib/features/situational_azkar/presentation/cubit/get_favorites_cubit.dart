import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/entities/situational_azkar_favorites.dart';
import 'package:bank_el_ziker/features/situational_azkar/domain/usecases/get_favorites.dart';

class GetFavoritesCubit extends RequestCubit<SituationalAzkarFavorites> {
  final GetFavorites getFavorites;

  GetFavoritesCubit({
    required this.getFavorites,
  }) : super(
          callOnCreate: true,
          request: () => getFavorites(const NoParams()),
        );
}
