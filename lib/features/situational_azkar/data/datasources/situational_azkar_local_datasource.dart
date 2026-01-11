import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SituationalAzkarLocalDataSource {
  Future<List<Zikr>> getSituationalAzkar();
  Future<List<int>> getFavoriteIds();
  Future<void> toggleFavorite(int zikrId);
}

class SituationalAzkarLocalDataSourceImpl
    implements SituationalAzkarLocalDataSource {
  final Box<Zikr> situationalAzkarBox;
  final SharedPreferences sharedPreferences;

  static const String _favoritesKey = 'favourite_situational_azkar';

  SituationalAzkarLocalDataSourceImpl({
    required Box<Zikr> box,
    required this.sharedPreferences,
  }) : situationalAzkarBox = box;

  @override
  Future<List<Zikr>> getSituationalAzkar() async {
    return situationalAzkarBox.values.toList();
  }

  @override
  Future<List<int>> getFavoriteIds() async {
    final List<String> stringIds =
        sharedPreferences.getStringList(_favoritesKey) ?? [];
    return stringIds.map((id) => int.parse(id)).toList();
  }

  @override
  Future<void> toggleFavorite(int zikrId) async {
    final List<String> currentIds =
        sharedPreferences.getStringList(_favoritesKey) ?? [];
    final String idString = zikrId.toString();

    if (currentIds.contains(idString)) {
      currentIds.remove(idString);
    } else {
      currentIds.add(idString);
    }

    await sharedPreferences.setStringList(_favoritesKey, currentIds);
  }
}
