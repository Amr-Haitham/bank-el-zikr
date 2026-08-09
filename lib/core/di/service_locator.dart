import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';

// zikr_counter imports
import '../../features/zikr_counter/data/datasources/counter_local_datasource.dart';
import '../../features/zikr_counter/data/models/general_data_model.dart';
import '../../features/zikr_counter/data/repositories/counter_repository_impl.dart';
import '../../features/zikr_counter/domain/repositories/counter_repository.dart';
import '../../features/zikr_counter/domain/usecases/get_counter_state.dart';
import '../../features/zikr_counter/domain/usecases/get_current_zikr_key.dart';
import '../../features/zikr_counter/domain/usecases/increment_balance.dart';
import '../../features/zikr_counter/domain/usecases/update_counter.dart';
import '../../features/zikr_counter/domain/usecases/update_current_zikr.dart';
import '../../features/zikr_counter/domain/usecases/update_goal.dart';
import '../../features/zikr_counter/presentation/cubit/get_counter_state_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/update_counter_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/update_current_zikr_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/update_goal_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/increment_balance_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/get_current_zikr_key_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/counter_cubit.dart';

// adhkar imports
import '../../features/adhkar/data/datasources/azkar_local_datasource.dart';
import '../../core/data/models/zikr_model.dart';
import '../../features/adhkar/data/repositories/azkar_repository_impl.dart';
import '../../features/adhkar/domain/repositories/azkar_repository.dart';
import '../../features/adhkar/domain/usecases/add_custom_zikr.dart';
import '../../features/adhkar/domain/usecases/delete_custom_zikr.dart';
import '../../features/adhkar/domain/usecases/get_all_azkar.dart';
import '../../features/adhkar/domain/usecases/update_custom_zikr.dart';
import '../../features/adhkar/presentation/cubit/get_all_azkar_cubit.dart';
import '../../features/adhkar/presentation/cubit/add_custom_zikr_cubit.dart';
import '../../features/adhkar/presentation/cubit/update_custom_zikr_cubit.dart';
import '../../features/adhkar/presentation/cubit/delete_custom_zikr_cubit.dart';

// azkar_records imports
import '../../features/azkar_records/data/datasources/day_record_local_datasource.dart';
import '../../features/azkar_records/data/models/day_record_model.dart';
import '../../features/azkar_records/data/repositories/day_record_repository_impl.dart';
import '../../features/azkar_records/domain/repositories/day_record_repository.dart';
import '../../features/azkar_records/domain/usecases/get_all_day_records.dart';
import '../../features/azkar_records/domain/usecases/get_week_azkar_records.dart';
import '../../features/azkar_records/domain/usecases/log_zikr_increment.dart';
import '../../features/azkar_records/domain/usecases/mark_category_completed.dart';
import '../../features/azkar_records/domain/usecases/delete_zikr_record.dart';
import '../../features/azkar_records/presentation/cubit/get_week_azkar_records_cubit.dart';
import '../../features/azkar_records/presentation/cubit/day_record_cubit.dart';
import '../../features/azkar_records/presentation/cubit/delete_zikr_record_cubit.dart';
import '../../features/azkar_records/data/models/reading_progress_model.dart';
import '../../features/azkar_records/data/datasources/reading_progress_local_datasource.dart';
import '../../features/azkar_records/data/repositories/reading_progress_repository_impl.dart';
import '../../features/azkar_records/domain/repositories/reading_progress_repository.dart';
import '../../features/azkar_records/domain/usecases/get_all_reading_progress.dart';
import '../../features/azkar_records/domain/usecases/save_reading_progress.dart';
import '../../features/azkar_records/presentation/cubit/reading_progress_cubit.dart';

// zikr category imports
import '../../features/adhkar/data/datasources/zikr_category_local_datasource.dart';
import '../../features/adhkar/data/repositories/zikr_category_repository_impl.dart';
import '../../features/adhkar/domain/repositories/zikr_category_repository.dart';
import '../../features/adhkar/domain/usecases/get_zikr_by_category.dart';
import '../../features/adhkar/presentation/cubit/zikr_category_cubit.dart';

// settings imports
import '../../features/settings/data/datasources/settings_local_datasource.dart';
import '../../features/settings/data/repositories/settings_repository_impl.dart';
import '../../features/settings/domain/repositories/settings_repository.dart';
import '../../features/settings/domain/usecases/get_settings.dart';
import '../../features/settings/domain/usecases/update_settings.dart';
import '../../features/settings/presentation/cubit/settings_cubit.dart';

// notifications imports
import '../../features/notifications/data/datasources/location_local_datasource.dart';
import '../../features/notifications/data/datasources/notification_local_datasource.dart';
import '../../features/notifications/data/repositories/location_repository_impl.dart';
import '../../features/notifications/data/repositories/notification_scheduler_repository_impl.dart';
import '../../features/notifications/domain/repositories/location_repository.dart';
import '../../features/notifications/domain/repositories/notification_scheduler_repository.dart';
import '../../features/notifications/domain/usecases/get_current_coordinates.dart';
import '../../features/notifications/domain/usecases/get_prayer_times.dart';
import '../../features/notifications/domain/usecases/schedule_adhkar_reminders.dart';
import '../../features/notifications/presentation/cubit/prayer_times_cubit.dart';

// home imports
import '../../features/home/data/datasources/home_local_datasource.dart';
import '../../features/home/data/models/prayer_model.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_random_prayer.dart';
import '../../features/home/presentation/cubit/get_random_prayer_cubit.dart';

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

  _setUpAdhkarDataSources();
  _setUpAdhkarRepositories();
  _setUpAdhkarUseCases();
  _setUpAdhkarBlocs();

  _setUpDayRecordDataSources();
  _setUpDayRecordRepositories();
  _setUpDayRecordUseCases();
  _setUpDayRecordBlocs();

  _setUpReadingProgressDataSources();
  _setUpReadingProgressRepositories();
  _setUpReadingProgressUseCases();
  _setUpReadingProgressBlocs();

  _setUpZikrCategoryDataSources();
  _setUpZikrCategoryRepositories();
  _setUpZikrCategoryUseCases();
  _setUpZikrCategoryBlocs();

  _setUpSettingsDataSources();
  _setUpSettingsRepositories();
  _setUpSettingsUseCases();

  _setUpNotificationsDataSources();
  _setUpNotificationsRepositories();
  _setUpNotificationsUseCases();
  _setUpNotificationsBlocs();

  _setUpSettingsBlocs();

  _setUpHomeDataSources();
  _setUpHomeRepositories();
  _setUpHomeUseCases();
  _setUpHomeBlocs();
}

/// Setup external dependencies like Hive boxes
Future<void> _setUpExternalDependencies() async {
  // zikr_counter
  final counterBox = Hive.box<GeneralData>(generalDataHiveBox);
  _getIt.registerLazySingleton<Box<GeneralData>>(
    () => counterBox,
    instanceName: 'counterBox',
  );

  // adhkar
  final defaultAzkarBox = Hive.box<Zikr>(zikrHiveBox);
  final customAzkarBox = Hive.box<Zikr>(customAzkarHiveBox);
  _getIt.registerLazySingleton<Box<Zikr>>(
    () => defaultAzkarBox,
    instanceName: 'defaultAzkarBox',
  );
  _getIt.registerLazySingleton<Box<Zikr>>(
    () => customAzkarBox,
    instanceName: 'customAzkarBox',
  );

  // azkar_records
  final dayRecordBox = Hive.box<DayRecord>(dayRecordHiveBox);
  _getIt.registerLazySingleton<Box<DayRecord>>(
    () => dayRecordBox,
    instanceName: 'dayRecordBox',
  );
  final readingProgressBox =
      Hive.box<ReadingProgress>(readingProgressHiveBox);
  _getIt.registerLazySingleton<Box<ReadingProgress>>(
    () => readingProgressBox,
    instanceName: 'readingProgressBox',
  );

  // home (prayer)
  final prayerBox = Hive.box<Prayer>(prayerHiveBox);
  _getIt.registerLazySingleton<Box<Prayer>>(
    () => prayerBox,
    instanceName: 'prayerBox',
  );

  // zikr category — reads from the same unified Zikr box as everything else
  _getIt.registerLazySingleton<Box<Zikr>>(
    () => defaultAzkarBox,
    instanceName: 'zikrCategoryBox',
  );
  // shared_preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  _getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // notifications plugin
  _getIt.registerLazySingleton<FlutterLocalNotificationsPlugin>(
    () => FlutterLocalNotificationsPlugin(),
  );
}

// ============================================================================
// zikr_counter
// ============================================================================

void _setUpZikrCounterDataSources() {
  _getIt.registerLazySingleton<CounterLocalDataSource>(
    () => CounterLocalDataSourceImpl(
      box: Hive.box<GeneralData>('generalDataHiveBox'),
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
  _getIt.registerLazySingleton<GetCurrentZikrKey>(
    () => GetCurrentZikrKey(getService<CounterRepository>()),
  );
}

void _setUpZikrCounterBlocs() {
  _getIt.registerLazySingleton<CounterCubit>(
    () => CounterCubit(
      getCounterState: getService<GetCounterState>(),
      getCurrentZikrKey: getService<GetCurrentZikrKey>(),
      updateCounter: getService<UpdateCounter>(),
      updateCurrentZikr: getService<UpdateCurrentZikr>(),
      updateGoal: getService<UpdateGoal>(),
      incrementBalance: getService<IncrementBalance>(),
    ),
  );
  _getIt.registerFactory<GetCounterStateCubit>(
    () => GetCounterStateCubit(getCounterState: getService<GetCounterState>()),
  );
  _getIt.registerFactory<UpdateCounterCubit>(
    () => UpdateCounterCubit(updateCounter: getService<UpdateCounter>()),
  );
  _getIt.registerFactory<UpdateCurrentZikrCubit>(
    () => UpdateCurrentZikrCubit(
        updateCurrentZikr: getService<UpdateCurrentZikr>()),
  );
  _getIt.registerFactory<UpdateGoalCubit>(
    () => UpdateGoalCubit(updateGoal: getService<UpdateGoal>()),
  );
  _getIt.registerFactory<IncrementBalanceCubit>(
    () =>
        IncrementBalanceCubit(incrementBalance: getService<IncrementBalance>()),
  );
  _getIt.registerFactory<GetCurrentZikrKeyCubit>(
    () => GetCurrentZikrKeyCubit(
        getCurrentZikrKey: getService<GetCurrentZikrKey>()),
  );
}

// ============================================================================
// adhkar
// ============================================================================

void _setUpAdhkarDataSources() {
  _getIt.registerLazySingleton<AzkarLocalDataSource>(
    () => AzkarLocalDataSourceImpl(
      defaultAzkarBox: getService<Box<Zikr>>(instanceName: 'defaultAzkarBox'),
      customAzkarBox: getService<Box<Zikr>>(instanceName: 'customAzkarBox'),
    ),
  );
}

void _setUpAdhkarRepositories() {
  _getIt.registerLazySingleton<AzkarRepository>(
    () => AzkarRepositoryImpl(
      localDataSource: getService<AzkarLocalDataSource>(),
    ),
  );
}

void _setUpAdhkarUseCases() {
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

void _setUpAdhkarBlocs() {
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

void _setUpDayRecordDataSources() {
  _getIt.registerLazySingleton<DayRecordLocalDataSource>(
    () => DayRecordLocalDataSourceImpl(
      box: getService<Box<DayRecord>>(instanceName: 'dayRecordBox'),
    ),
  );
}

void _setUpDayRecordRepositories() {
  _getIt.registerLazySingleton<DayRecordRepository>(
    () => DayRecordRepositoryImpl(
      localDataSource: getService<DayRecordLocalDataSource>(),
    ),
  );
}

void _setUpDayRecordUseCases() {
  _getIt.registerLazySingleton<GetAllDayRecords>(
    () => GetAllDayRecords(getService<DayRecordRepository>()),
  );
  _getIt.registerLazySingleton<GetWeekAzkarRecords>(
    () => GetWeekAzkarRecords(getService<DayRecordRepository>()),
  );
  _getIt.registerLazySingleton<LogZikrIncrement>(
    () => LogZikrIncrement(getService<DayRecordRepository>()),
  );
  _getIt.registerLazySingleton<MarkCategoryCompleted>(
    () => MarkCategoryCompleted(getService<DayRecordRepository>()),
  );
  _getIt.registerLazySingleton<DeleteZikrRecord>(
    () => DeleteZikrRecord(getService<DayRecordRepository>()),
  );
}

void _setUpDayRecordBlocs() {
  _getIt.registerLazySingleton<DayRecordCubit>(
    () => DayRecordCubit(
      getAllDayRecords: getService<GetAllDayRecords>(),
      logZikrIncrementUseCase: getService<LogZikrIncrement>(),
      markCategoryCompletedUseCase: getService<MarkCategoryCompleted>(),
    ),
  );
  _getIt.registerFactory<GetWeekAzkarRecordsCubit>(
    () => GetWeekAzkarRecordsCubit(
        getWeekAzkarRecords: getService<GetWeekAzkarRecords>()),
  );
  _getIt.registerFactory<DeleteZikrRecordCubit>(
    () =>
        DeleteZikrRecordCubit(deleteZikrRecord: getService<DeleteZikrRecord>()),
  );
}

// ============================================================================
// reading_progress
// ============================================================================

void _setUpReadingProgressDataSources() {
  _getIt.registerLazySingleton<ReadingProgressLocalDataSource>(
    () => ReadingProgressLocalDataSourceImpl(
      box: getService<Box<ReadingProgress>>(
          instanceName: 'readingProgressBox'),
    ),
  );
}

void _setUpReadingProgressRepositories() {
  _getIt.registerLazySingleton<ReadingProgressRepository>(
    () => ReadingProgressRepositoryImpl(
      localDataSource: getService<ReadingProgressLocalDataSource>(),
    ),
  );
}

void _setUpReadingProgressUseCases() {
  _getIt.registerLazySingleton<GetAllReadingProgress>(
    () => GetAllReadingProgress(getService<ReadingProgressRepository>()),
  );
  _getIt.registerLazySingleton<SaveReadingProgress>(
    () => SaveReadingProgress(getService<ReadingProgressRepository>()),
  );
}

void _setUpReadingProgressBlocs() {
  _getIt.registerLazySingleton<ReadingProgressCubit>(
    () => ReadingProgressCubit(
      getAllReadingProgress: getService<GetAllReadingProgress>(),
      saveReadingProgressUseCase: getService<SaveReadingProgress>(),
    ),
  );
}

// ============================================================================
// zikr category
// ============================================================================

void _setUpZikrCategoryDataSources() {
  _getIt.registerLazySingleton<ZikrCategoryLocalDataSource>(
    () => ZikrCategoryLocalDataSourceImpl(
      box: getService<Box<Zikr>>(instanceName: 'zikrCategoryBox'),
    ),
  );
}

void _setUpZikrCategoryRepositories() {
  _getIt.registerLazySingleton<ZikrCategoryRepository>(
    () => ZikrCategoryRepositoryImpl(
      localDataSource: getService<ZikrCategoryLocalDataSource>(),
    ),
  );
}

void _setUpZikrCategoryUseCases() {
  _getIt.registerLazySingleton<GetZikrByCategory>(
    () => GetZikrByCategory(getService<ZikrCategoryRepository>()),
  );
}

void _setUpZikrCategoryBlocs() {
  _getIt.registerFactory<ZikrCategoryCubit>(
    () => ZikrCategoryCubit(
      getZikrByCategory: getService<GetZikrByCategory>(),
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
  _getIt.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit(
      getSettings: getService<GetSettings>(),
      updateSettings: getService<UpdateSettings>(),
      scheduleAdhkarReminders: getService<ScheduleAdhkarReminders>(),
      getCurrentCoordinates: getService<GetCurrentCoordinates>(),
    ),
  );
}

// ============================================================================
// notifications
// ============================================================================

void _setUpNotificationsDataSources() {
  _getIt.registerLazySingleton<LocationLocalDataSource>(
    () => LocationLocalDataSourceImpl(
      sharedPreferences: getService<SharedPreferences>(),
    ),
  );
  _getIt.registerLazySingleton<NotificationLocalDataSource>(
    () => NotificationLocalDataSourceImpl(
      plugin: getService<FlutterLocalNotificationsPlugin>(),
    ),
  );
}

void _setUpNotificationsRepositories() {
  _getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(
      localDataSource: getService<LocationLocalDataSource>(),
    ),
  );
  _getIt.registerLazySingleton<NotificationSchedulerRepository>(
    () => NotificationSchedulerRepositoryImpl(
      localDataSource: getService<NotificationLocalDataSource>(),
    ),
  );
}

void _setUpNotificationsUseCases() {
  _getIt.registerLazySingleton<GetPrayerTimes>(() => GetPrayerTimes());
  _getIt.registerLazySingleton<GetCurrentCoordinates>(
    () => GetCurrentCoordinates(getService<LocationRepository>()),
  );
  _getIt.registerLazySingleton<ScheduleAdhkarReminders>(
    () => ScheduleAdhkarReminders(
      settingsRepository: getService<SettingsRepository>(),
      locationRepository: getService<LocationRepository>(),
      getPrayerTimes: getService<GetPrayerTimes>(),
      schedulerRepository: getService<NotificationSchedulerRepository>(),
    ),
  );
}

void _setUpNotificationsBlocs() {
  _getIt.registerFactory<PrayerTimesCubit>(
    () => PrayerTimesCubit(
      locationRepository: getService<LocationRepository>(),
      getPrayerTimes: getService<GetPrayerTimes>(),
    ),
  );
}

// ============================================================================
// home
// ============================================================================

void _setUpHomeDataSources() {
  _getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(
      prayerBox: getService<Box<Prayer>>(instanceName: 'prayerBox'),
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
  _getIt.registerFactory<GetRandomPrayerCubit>(
    () => GetRandomPrayerCubit(getRandomPrayer: getService<GetRandomPrayer>()),
  );
}
