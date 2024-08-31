

import 'package:shared_preferences/shared_preferences.dart';

class FavSituationalAzkarSharePref {
  static const String _favouriteSituationalAzkar = 'favourite_situational_azkar';

  // Function to add a new ID to the list
  Future<void> addOrRemoveFromFavourites(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> currentIds = prefs.getStringList(_favouriteSituationalAzkar) ?? [];
    if (!currentIds.contains(id)) {
      currentIds.add(id);
      await prefs.setStringList(_favouriteSituationalAzkar, currentIds);
    }else{
      currentIds.remove(id);
      await prefs.setStringList(_favouriteSituationalAzkar, currentIds);
    }
  }

  // Function to get all stored IDs
  Future<List<String>> getAllIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favouriteSituationalAzkar) ?? [];
  }
}
