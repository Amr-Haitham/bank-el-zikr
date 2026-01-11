import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

/// Get a registered service from the service locator
T getService<T extends Object>({String? instanceName}) {
  if (instanceName != null) {
    return _getIt<T>(instanceName: instanceName);
  }
  return _getIt<T>();
}

/// Setup all dependencies for the application
/// Call this method before running the app
Future<void> setupServiceLocator() async {
  // Will grow with each feature migration
  await _setUpExternalDependencies();

  // Feature-specific setups will be added here as we migrate each feature
  // Example:
  // _setUpGeneralDataManagement();
  // _setUpSettingsManagement();
  // _setUpZikrManagement();
}

/// Setup external dependencies like Hive boxes
Future<void> _setUpExternalDependencies() async {
  // Hive boxes will be registered here as features are migrated
  // This keeps the old HiveDB initialization working while we gradually migrate
}

