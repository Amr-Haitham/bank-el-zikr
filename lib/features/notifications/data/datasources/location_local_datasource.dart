import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationPermissionDeniedException implements Exception {
  const LocationPermissionDeniedException();
}

class LocationServiceDisabledException implements Exception {
  const LocationServiceDisabledException();
}

class LocationUnavailableException implements Exception {
  const LocationUnavailableException();
}

abstract class LocationLocalDataSource {
  Future<({double latitude, double longitude})> getCurrentCoordinates();
  Future<void> openLocationSettings();
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

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const LocationPermissionDeniedException();
    }

    if (!serviceEnabled) {
      final cached = _cachedCoordinates();
      if (cached != null) return cached;
      throw const LocationServiceDisabledException();
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
      final cached = _cachedCoordinates();
      if (cached != null) return cached;
      throw const LocationUnavailableException();
    }
  }

  ({double latitude, double longitude})? _cachedCoordinates() {
    final latitude = sharedPreferences.getDouble(_latitudeKey);
    final longitude = sharedPreferences.getDouble(_longitudeKey);
    if (latitude == null || longitude == null) return null;
    return (latitude: latitude, longitude: longitude);
  }

  @override
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }
}
