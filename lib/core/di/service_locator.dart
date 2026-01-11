import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

// zikr_counter imports
import '../../features/zikr_counter/data/datasources/counter_local_datasource.dart';
import '../../features/zikr_counter/data/models/counter_state_model.dart';
import '../../features/zikr_counter/data/repositories/counter_repository_impl.dart';
import '../../features/zikr_counter/domain/repositories/counter_repository.dart';
import '../../features/zikr_counter/domain/usecases/get_counter_state.dart';
import '../../features/zikr_counter/domain/usecases/get_current_zikr_id.dart';
import '../../features/zikr_counter/domain/usecases/increment_balance.dart';
import '../../features/zikr_counter/domain/usecases/update_counter.dart';
import '../../features/zikr_counter/domain/usecases/update_current_zikr.dart';
import '../../features/zikr_counter/domain/usecases/update_goal.dart';
import '../../features/zikr_counter/presentation/cubit/counter_cubit.dart';

// azkar_management imports
import '../../features/azkar_management/data/datasources/azkar_local_datasource.dart';
import '../../features/azkar_management/data/models/zikr_model.dart';
import '../../features/azkar_management/data/repositories/azkar_repository_impl.dart';
import '../../features/azkar_management/domain/repositories/azkar_repository.dart';
import '../../features/azkar_management/domain/usecases/add_custom_zikr.dart';
import '../../features/azkar_management/domain/usecases/delete_custom_zikr.dart';
import '../../features/azkar_management/domain/usecases/get_all_azkar.dart';
import '../../features/azkar_management/domain/usecases/update_custom_zikr.dart';
import '../../features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import '../../features/azkar_management/presentation/cubit/add_custom_zikr_cubit.dart';
import '../../features/azkar_management/presentation/cubit/update_custom_zikr_cubit.dart';
import '../../features/azkar_management/presentation/cubit/delete_custom_zikr_cubit.dart';

// azkar_records imports
import '../../features/azkar_records/data/datasources/azkar_records_local_datasource.dart';
import '../../features/azkar_records/data/models/day_zikr_record_model.dart';
import '../../features/azkar_records/data/repositories/azkar_records_repository_impl.dart';
import '../../features/azkar_records/domain/repositories/azkar_records_repository.dart';
import '../../features/azkar_records/domain/usecases/fix_and_increment_record.dart';
import '../../features/azkar_records/domain/usecases/get_week_azkar_records.dart';
import '../../features/azkar_records/presentation/cubit/azkar_records_cubit.dart';

// morning_night_azkar imports
import '../../features/morning_night_azkar/data/datasources/morning_night_azkar_local_datasource.dart';
import '../../features/morning_night_azkar/data/models/morning_night_zikr_model.dart';
import '../../features/morning_night_azkar/data/repositories/morning_night_azkar_repository_impl.dart';
import '../../features/morning_night_azkar/domain/repositories/morning_night_azkar_repository.dart';
import '../../features/morning_night_azkar/domain/usecases/get_morning_azkar.dart';
import '../../features/morning_night_azkar/domain/usecases/get_night_azkar.dart';
import '../../features/morning_night_azkar/presentation/cubit/morning_night_azkar_cubit.dart';

// situational_azkar imports
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/situational_azkar/data/datasources/situational_azkar_local_datasource.dart';
import '../../features/situational_azkar/data/repositories/situational_azkar_repository_impl.dart';
import '../../features/situational_azkar/domain/repositories/situational_azkar_repository.dart';
import '../../features/situational_azkar/domain/usecases/get_favorites.dart';
import '../../features/situational_azkar/domain/usecases/get_situational_azkar.dart';
import '../../features/situational_azkar/domain/usecases/toggle_favorite.dart';
import '../../features/situational_azkar/presentation/cubit/situational_azkar_cubit.dart';

// settings imports
import '../../features/settings/data/datasources/settings_local_datasource.dart';
import '../../features/settings/data/repositories/settings_repository_impl.dart';
import '../../features/settings/domain/repositories/settings_repository.dart';
import '../../features/settings/domain/usecases/get_settings.dart';
import '../../features/settings/domain/usecases/update_settings.dart';
import '../../features/settings/presentation/cubit/settings_cubit.dart';

// home imports
import '../../features/home/data/datasources/home_local_datasource.dart';
import '../../features/home/data/models/prayer_model.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_random_prayer.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';

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
  await _setUpExternalDependencies();

  // Feature-specific setups
  _setUpZikrCounterDataSources();
  _setUpZikrCounterRepositories();
  _setUpZikrCounterUseCases();
  _setUpZikrCounterBlocs();

  _setUpAzkarManagementDataSources();
  _setUpAzkarManagementRepositories();
  _setUpAzkarManagementUseCases();
  _setUpAzkarManagementBlocs();

  _setUpAzkarRecordsDataSources();
  _setUpAzkarRecordsRepositories();
  _setUpAzkarRecordsUseCases();
  _setUpAzkarRecordsBlocs();

  _setUpMorningNightAzkarDataSources();
  _setUpMorningNightAzkarRepositories();
  _setUpMorningNightAzkarUseCases();
  _setUpMorningNightAzkarBlocs();

  _setUpSituationalAzkarDataSources();
  _setUpSituationalAzkarRepositories();
  _setUpSituationalAzkarUseCases();
  _setUpSituationalAzkarBlocs();

  _setUpSettingsDataSources();
  _setUpSettingsRepositories();
  _setUpSettingsUseCases();
  _setUpSettingsBlocs();

  _setUpHomeDataSources();
  _setUpHomeRepositories();
  _setUpHomeUseCases();
  _setUpHomeBlocs();
}

/// Setup external dependencies like Hive boxes
Future<void> _setUpExternalDependencies() async {
  // zikr_counter
  final counterBox = Hive.box<CounterStateModel>('generalDataHiveBox');
  _getIt.registerLazySingleton<Box<CounterStateModel>>(
    () => counterBox,
    instanceName: 'counterBox',
  );

  // azkar_management
  final defaultAzkarBox = Hive.box<ZikrModel>('zikrHiveBox');
  final customAzkarBox = Hive.box<ZikrModel>('customAzkarHiveBox');
  _getIt.registerLazySingleton<Box<ZikrModel>>(
    () => defaultAzkarBox,
    instanceName: 'defaultAzkarBox',
  );
  _getIt.registerLazySingleton<Box<ZikrModel>>(
    () => customAzkarBox,
    instanceName: 'customAzkarBox',
  );

  // azkar_records
  final azkarRecordsBox = Hive.box<DayZikrRecordModel>('dayZikrRecordHiveBox');
  _getIt.registerLazySingleton<Box<DayZikrRecordModel>>(
    () => azkarRecordsBox,
    instanceName: 'azkarRecordsBox',
  );

  // morning_night_azkar
  final morningAzkarBox =
      Hive.box<MorningNightZikrModel>('morningAzkarHiveBox');
  final nightAzkarBox = Hive.box<MorningNightZikrModel>('nightAzkarHiveBox');
  _getIt.registerLazySingleton<Box<MorningNightZikrModel>>(
    () => morningAzkarBox,
    instanceName: 'morningAzkarBox',
  );
  _getIt.registerLazySingleton<Box<MorningNightZikrModel>>(
    () => nightAzkarBox,
    instanceName: 'nightAzkarBox',
  );

  // situational_azkar
  final situationalAzkarBox = Hive.box<ZikrModel>('conditionalAzkarHiveBox');
  _getIt.registerLazySingleton<Box<ZikrModel>>(
    () => situationalAzkarBox,
    instanceName: 'situationalAzkarBox',
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  _getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // home
  final prayerBox = Hive.box<PrayerModel>('prayerHiveBox');
  _getIt.registerLazySingleton<Box<PrayerModel>>(
    () => prayerBox,
    instanceName: 'prayerBox',
  );
}

// ============================================================================
// zikr_counter
// ============================================================================

void _setUpZikrCounterDataSources() {
  _getIt.registerLazySingleton<CounterLocalDataSource>(
    () => CounterLocalDataSourceImpl(
      box: getService<Box<CounterStateModel>>(instanceName: 'counterBox'),
    ),
  );
}

void _setUpZikrCounterRepositories() {
  _getIt.registerLazySingleton<CounterRepository>(
    () => CounterRepositoryImpl(
      localDataSource: getService<CounterLocalDataSource>(),
    ),
  );
}

void _setUpZikrCounterUseCases() {
  _getIt.registerLazySingleton<GetCounterState>(
    () => GetCounterState(getService<CounterRepository>()),
  );
  _getIt.registerLazySingleton<UpdateCounter>(
    () => UpdateCounter(getService<CounterRepository>()),
  );
  _getIt.registerLazySingleton<UpdateCurrentZikr>(
    () => UpdateCurrentZikr(getService<CounterRepository>()),
  );
  _getIt.registerLazySingleton<UpdateGoal>(
    () => UpdateGoal(getService<CounterRepository>()),
  );
  _getIt.registerLazySingleton<IncrementBalance>(
    () => IncrementBalance(getService<CounterRepository>()),
  );
  _getIt.registerLazySingleton<GetCurrentZikrId>(
    () => GetCurrentZikrId(getService<CounterRepository>()),
  );
}

void _setUpZikrCounterBlocs() {
  _getIt.registerFactory<CounterCubit>(
    () => CounterCubit(
      getCounterState: getService<GetCounterState>(),
      getCurrentZikrId: getService<GetCurrentZikrId>(),
      updateCounter: getService<UpdateCounter>(),
      updateCurrentZikr: getService<UpdateCurrentZikr>(),
      updateGoal: getService<UpdateGoal>(),
      incrementBalance: getService<IncrementBalance>(),
    ),
  );
}

// ============================================================================
// azkar_management
// ============================================================================

void _setUpAzkarManagementDataSources() {
  _getIt.registerLazySingleton<AzkarLocalDataSource>(
    () => AzkarLocalDataSourceImpl(
      defaultAzkarBox:
          getService<Box<ZikrModel>>(instanceName: 'defaultAzkarBox'),
      customAzkarBox:
          getService<Box<ZikrModel>>(instanceName: 'customAzkarBox'),
    ),
  );
}

void _setUpAzkarManagementRepositories() {
  _getIt.registerLazySingleton<AzkarRepository>(
    () => AzkarRepositoryImpl(
      localDataSource: getService<AzkarLocalDataSource>(),
    ),
  );
}

void _setUpAzkarManagementUseCases() {
  _getIt.registerLazySingleton<GetAllAzkar>(
    () => GetAllAzkar(getService<AzkarRepository>()),
  );
  _getIt.registerLazySingleton<AddCustomZikr>(
    () => AddCustomZikr(getService<AzkarRepository>()),
  );
  _getIt.registerLazySingleton<UpdateCustomZikr>(
    () => UpdateCustomZikr(getService<AzkarRepository>()),
  );
  _getIt.registerLazySingleton<DeleteCustomZikr>(
    () => DeleteCustomZikr(getService<AzkarRepository>()),
  );
}

void _setUpAzkarManagementBlocs() {
  _getIt.registerFactory<GetAllAzkarCubit>(
    () => GetAllAzkarCubit(
      getAllAzkar: getService<GetAllAzkar>(),
    ),
  );
  _getIt.registerFactory<AddCustomZikrCubit>(
    () => AddCustomZikrCubit(
      addCustomZikr: getService<AddCustomZikr>(),
    ),
  );
  _getIt.registerFactory<UpdateCustomZikrCubit>(
    () => UpdateCustomZikrCubit(
      updateCustomZikr: getService<UpdateCustomZikr>(),
    ),
  );
  _getIt.registerFactory<DeleteCustomZikrCubit>(
    () => DeleteCustomZikrCubit(
      deleteCustomZikr: getService<DeleteCustomZikr>(),
    ),
  );
}

// ============================================================================
// azkar_records
// ============================================================================

void _setUpAzkarRecordsDataSources() {
  _getIt.registerLazySingleton<AzkarRecordsLocalDataSource>(
    () => AzkarRecordsLocalDataSourceImpl(
      box: getService<Box<DayZikrRecordModel>>(instanceName: 'azkarRecordsBox'),
    ),
  );
}

void _setUpAzkarRecordsRepositories() {
  _getIt.registerLazySingleton<AzkarRecordsRepository>(
    () => AzkarRecordsRepositoryImpl(
      localDataSource: getService<AzkarRecordsLocalDataSource>(),
    ),
  );
}

void _setUpAzkarRecordsUseCases() {
  _getIt.registerLazySingleton<GetWeekAzkarRecords>(
    () => GetWeekAzkarRecords(getService<AzkarRecordsRepository>()),
  );
  _getIt.registerLazySingleton<FixAndIncrementRecord>(
    () => FixAndIncrementRecord(getService<AzkarRecordsRepository>()),
  );
}

void _setUpAzkarRecordsBlocs() {
  _getIt.registerFactory<AzkarRecordsCubit>(
    () => AzkarRecordsCubit(
      getWeekAzkarRecords: getService<GetWeekAzkarRecords>(),
      fixAndIncrementRecord: getService<FixAndIncrementRecord>(),
    ),
  );
}

// ============================================================================
// morning_night_azkar
// ============================================================================

void _setUpMorningNightAzkarDataSources() {
  _getIt.registerLazySingleton<MorningNightAzkarLocalDataSource>(
    () => MorningNightAzkarLocalDataSourceImpl(
      morningAzkarBox: getService<Box<MorningNightZikrModel>>(
          instanceName: 'morningAzkarBox'),
      nightAzkarBox:
          getService<Box<MorningNightZikrModel>>(instanceName: 'nightAzkarBox'),
    ),
  );
}

void _setUpMorningNightAzkarRepositories() {
  _getIt.registerLazySingleton<MorningNightAzkarRepository>(
    () => MorningNightAzkarRepositoryImpl(
      localDataSource: getService<MorningNightAzkarLocalDataSource>(),
    ),
  );
}

void _setUpMorningNightAzkarUseCases() {
  _getIt.registerLazySingleton<GetMorningAzkar>(
    () => GetMorningAzkar(getService<MorningNightAzkarRepository>()),
  );
  _getIt.registerLazySingleton<GetNightAzkar>(
    () => GetNightAzkar(getService<MorningNightAzkarRepository>()),
  );
}

void _setUpMorningNightAzkarBlocs() {
  _getIt.registerFactory<MorningNightAzkarCubit>(
    () => MorningNightAzkarCubit(
      getMorningAzkar: getService<GetMorningAzkar>(),
      getNightAzkar: getService<GetNightAzkar>(),
    ),
  );
}

// ============================================================================
// situational_azkar
// ============================================================================

void _setUpSituationalAzkarDataSources() {
  _getIt.registerLazySingleton<SituationalAzkarLocalDataSource>(
    () => SituationalAzkarLocalDataSourceImpl(
      situationalAzkarBox:
          getService<Box<ZikrModel>>(instanceName: 'situationalAzkarBox'),
      sharedPreferences: getService<SharedPreferences>(),
    ),
  );
}

void _setUpSituationalAzkarRepositories() {
  _getIt.registerLazySingleton<SituationalAzkarRepository>(
    () => SituationalAzkarRepositoryImpl(
      localDataSource: getService<SituationalAzkarLocalDataSource>(),
    ),
  );
}

void _setUpSituationalAzkarUseCases() {
  _getIt.registerLazySingleton<GetSituationalAzkar>(
    () => GetSituationalAzkar(getService<SituationalAzkarRepository>()),
  );
  _getIt.registerLazySingleton<GetFavorites>(
    () => GetFavorites(getService<SituationalAzkarRepository>()),
  );
  _getIt.registerLazySingleton<ToggleFavorite>(
    () => ToggleFavorite(getService<SituationalAzkarRepository>()),
  );
}

void _setUpSituationalAzkarBlocs() {
  _getIt.registerFactory<SituationalAzkarCubit>(
    () => SituationalAzkarCubit(
      getSituationalAzkar: getService<GetSituationalAzkar>(),
      getFavorites: getService<GetFavorites>(),
      toggleFavorite: getService<ToggleFavorite>(),
    ),
  );
}

// ============================================================================
// settings
// ============================================================================

void _setUpSettingsDataSources() {
  _getIt.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(
      sharedPreferences: getService<SharedPreferences>(),
    ),
  );
}

void _setUpSettingsRepositories() {
  _getIt.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(
      localDataSource: getService<SettingsLocalDataSource>(),
    ),
  );
}

void _setUpSettingsUseCases() {
  _getIt.registerLazySingleton<GetSettings>(
    () => GetSettings(getService<SettingsRepository>()),
  );
  _getIt.registerLazySingleton<UpdateSettings>(
    () => UpdateSettings(getService<SettingsRepository>()),
  );
}

void _setUpSettingsBlocs() {
  _getIt.registerFactory<SettingsCubit>(
    () => SettingsCubit(
      getSettings: getService<GetSettings>(),
      updateSettings: getService<UpdateSettings>(),
    ),
  );
}

// ============================================================================
// home
// ============================================================================

void _setUpHomeDataSources() {
  _getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(
      prayerBox: getService<Box<PrayerModel>>(instanceName: 'prayerBox'),
    ),
  );
}

void _setUpHomeRepositories() {
  _getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      localDataSource: getService<HomeLocalDataSource>(),
    ),
  );
}

void _setUpHomeUseCases() {
  _getIt.registerLazySingleton<GetRandomPrayer>(
    () => GetRandomPrayer(getService<HomeRepository>()),
  );
}

void _setUpHomeBlocs() {
  _getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getRandomPrayer: getService<GetRandomPrayer>(),
    ),
  );
}
