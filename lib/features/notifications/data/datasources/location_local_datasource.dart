import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocationLocalDataSource {
  Future<({double latitude, double longitude})> getCurrentCoordinates();
}

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _latitudeKey = 'lastKnownLatitude';
  static const String _longitudeKey = 'lastKnownLongitude';

  LocationLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<({double latitude, double longitude})> getCurrentCoordinates() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('Location permission denied.');
    }

    final permissionGranted = permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;

    if (!serviceEnabled || !permissionGranted) {
      return _lastKnownOrThrow();
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
        ),
      ).timeout(const Duration(seconds: 8));
      await sharedPreferences.setDouble(_latitudeKey, position.latitude);
      await sharedPreferences.setDouble(_longitudeKey, position.longitude);
      return (latitude: position.latitude, longitude: position.longitude);
    } catch (_) {
      return _lastKnownOrThrow();
    }
  }

  ({double latitude, double longitude}) _lastKnownOrThrow() {
    final latitude = sharedPreferences.getDouble(_latitudeKey);
    final longitude = sharedPreferences.getDouble(_longitudeKey);
    if (latitude == null || longitude == null) {
      throw Exception('Location unavailable and no cached location found.');
    }
    return (latitude: latitude, longitude: longitude);
  }
}
