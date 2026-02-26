import 'package:equatable/equatable.dart';

class SituationalAzkarFavorites extends Equatable {
  final List<int> favoriteIds;

  const SituationalAzkarFavorites({
    required this.favoriteIds,
  });

  @override
  List<Object?> get props => [favoriteIds];
}
