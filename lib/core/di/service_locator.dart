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
import '../../features/zikr_counter/domain/usecases/get_current_zikr_id.dart';
import '../../features/zikr_counter/domain/usecases/increment_balance.dart';
import '../../features/zikr_counter/domain/usecases/update_counter.dart';
import '../../features/zikr_counter/domain/usecases/update_current_zikr.dart';
import '../../features/zikr_counter/domain/usecases/update_goal.dart';
import '../../features/zikr_counter/presentation/cubit/get_counter_state_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/update_counter_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/update_current_zikr_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/update_goal_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/increment_balance_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/get_current_zikr_id_cubit.dart';
import '../../features/zikr_counter/presentation/cubit/counter_cubit.dart';

// adhkar imports
import '../../features/adhkar/data/datasources/azkar_local_datasource.dart';
import '../../core/layers/data/models/zikr_model.dart';
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
import '../../features/azkar_records/data/datasources/azkar_records_local_datasource.dart';
import '../../features/azkar_records/data/models/day_zikr_record_model.dart';
import '../../features/azkar_records/data/repositories/azkar_records_repository_impl.dart';
import '../../features/azkar_records/domain/repositories/azkar_records_repository.dart';
import '../../features/azkar_records/domain/usecases/fix_and_increment_record.dart';
import '../../features/azkar_records/domain/usecases/get_week_azkar_records.dart';
import '../../features/azkar_records/domain/usecases/delete_zikr_record.dart';
import '../../features/azkar_records/presentation/cubit/get_week_azkar_records_cubit.dart';
import '../../features/azkar_records/presentation/cubit/fix_and_increment_record_cubit.dart';
import '../../features/azkar_records/presentation/cubit/delete_zikr_record_cubit.dart';
import '../../features/azkar_records/presentation/cubit/azkar_records_cubit.dart';
import '../../features/azkar_records/data/datasources/adhkar_progress_local_datasource.dart';
import '../../features/azkar_records/data/repositories/adhkar_progress_repository_impl.dart';
import '../../features/azkar_records/domain/repositories/adhkar_progress_repository.dart';
import '../../features/azkar_records/domain/usecases/get_all_adhkar_progress.dart';
import '../../features/azkar_records/domain/usecases/save_adhkar_progress.dart';
import '../../features/azkar_records/presentation/cubit/adhkar_progress_cubit.dart';
import '../../features/azkar_records/data/datasources/daily_activity_log_local_datasource.dart';
import '../../features/azkar_records/data/repositories/daily_activity_log_repository_impl.dart';
import '../../features/azkar_records/domain/repositories/daily_activity_log_repository.dart';
import '../../features/azkar_records/domain/usecases/get_daily_activity_log.dart';
import '../../features/azkar_records/domain/usecases/log_zikr_increment.dart';
import '../../features/azkar_records/domain/usecases/mark_adhkar_completed.dart';
import '../../features/azkar_records/presentation/cubit/daily_activity_log_cubit.dart';

// morning_night_azkar imports
import '../../features/adhkar/data/datasources/morning_night_azkar_local_datasource.dart';
import '../../features/adhkar/data/models/morning_night_zikr_model.dart';
import '../../features/adhkar/data/repositories/morning_night_azkar_repository_impl.dart';
import '../../features/adhkar/domain/repositories/morning_night_azkar_repository.dart';
import '../../features/adhkar/domain/usecases/get_morning_azkar.dart';
import '../../features/adhkar/domain/usecases/get_night_azkar.dart';
import '../../features/adhkar/presentation/cubit/morning_night_azkar_cubit.dart';

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

  _setUpAzkarRecordsDataSources();
  _setUpAzkarRecordsRepositories();
  _setUpAzkarRecordsUseCases();
  _setUpAzkarRecordsBlocs();

  _setUpAdhkarProgressDataSources();
  _setUpAdhkarProgressRepositories();
  _setUpAdhkarProgressUseCases();
  _setUpAdhkarProgressBlocs();

  _setUpDailyActivityLogDataSources();
  _setUpDailyActivityLogRepositories();
  _setUpDailyActivityLogUseCases();
  _setUpDailyActivityLogBlocs();

  _setUpMorningNightAzkarDataSources();
  _setUpMorningNightAzkarRepositories();
  _setUpMorningNightAzkarUseCases();
  _setUpMorningNightAzkarBlocs();

  _setUpZikrCategoryDataSources();
  _setUpZikrCategoryRepositories();
  _setUpZikrCategoryUseCases();
  _setUpZikrCategoryBlocs();

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
  final azkarRecordsBox = Hive.box<DayZikrRecord>(dayZikrRecordHiveBox);
  _getIt.registerLazySingleton<Box<DayZikrRecord>>(
    () => azkarRecordsBox,
    instanceName: 'azkarRecordsBox',
  );

  // morning_night_azkar
  final morningAzkarBox = Hive.box<MorningOrNightZikr>(morningAzkarHiveBox);
  final nightAzkarBox = Hive.box<MorningOrNightZikr>(nightAzkarHiveBox);
  _getIt.registerLazySingleton<Box<MorningOrNightZikr>>(
    () => morningAzkarBox,
    instanceName: 'morningAzkarBox',
  );
  _getIt.registerLazySingleton<Box<MorningOrNightZikr>>(
    () => nightAzkarBox,
    instanceName: 'nightAzkarBox',
  );

  // home (prayer)
  final prayerBox = Hive.box<Prayer>(prayerHiveBox);
  _getIt.registerLazySingleton<Box<Prayer>>(
    () => prayerBox,
    instanceName: 'prayerBox',
  );

  // zikr category
  final zikrCategoryBox = Hive.box<Zikr>(conditionalAzkarHiveBox);
  _getIt.registerLazySingleton<Box<Zikr>>(
    () => zikrCategoryBox,
    instanceName: 'zikrCategoryBox',
  );
  // shared_preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  _getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
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
  _getIt.registerLazySingleton<GetCurrentZikrId>(
    () => GetCurrentZikrId(getService<CounterRepository>()),
  );
}

void _setUpZikrCounterBlocs() {
  _getIt.registerLazySingleton<CounterCubit>(
    () => CounterCubit(
      getCounterState: getService<GetCounterState>(),
      getCurrentZikrId: getService<GetCurrentZikrId>(),
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
  _getIt.registerFactory<GetCurrentZikrIdCubit>(
    () =>
        GetCurrentZikrIdCubit(getCurrentZikrId: getService<GetCurrentZikrId>()),
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

void _setUpAzkarRecordsDataSources() {
  _getIt.registerLazySingleton<AzkarRecordsLocalDataSource>(
    () => AzkarRecordsLocalDataSourceImpl(
      box: getService<Box<DayZikrRecord>>(instanceName: 'azkarRecordsBox'),
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
  _getIt.registerLazySingleton<DeleteZikrRecord>(
    () => DeleteZikrRecord(getService<AzkarRecordsRepository>()),
  );
}

void _setUpAzkarRecordsBlocs() {
  _getIt.registerFactory<AzkarRecordsCubit>(
    () => AzkarRecordsCubit(
      getWeekAzkarRecords: getService<GetWeekAzkarRecords>(),
      fixAndIncrementRecord: getService<FixAndIncrementRecord>(),
    ),
  );
  _getIt.registerFactory<GetWeekAzkarRecordsCubit>(
    () => GetWeekAzkarRecordsCubit(
        getWeekAzkarRecords: getService<GetWeekAzkarRecords>()),
  );
  _getIt.registerFactory<FixAndIncrementRecordCubit>(
    () => FixAndIncrementRecordCubit(
        fixAndIncrementRecord: getService<FixAndIncrementRecord>()),
  );
  _getIt.registerFactory<DeleteZikrRecordCubit>(
    () =>
        DeleteZikrRecordCubit(deleteZikrRecord: getService<DeleteZikrRecord>()),
  );
}

// ============================================================================
// adhkar_progress
// ============================================================================

void _setUpAdhkarProgressDataSources() {
  _getIt.registerLazySingleton<AdhkarProgressLocalDataSource>(
    () => AdhkarProgressLocalDataSourceImpl(
      sharedPreferences: getService<SharedPreferences>(),
    ),
  );
}

void _setUpAdhkarProgressRepositories() {
  _getIt.registerLazySingleton<AdhkarProgressRepository>(
    () => AdhkarProgressRepositoryImpl(
      localDataSource: getService<AdhkarProgressLocalDataSource>(),
    ),
  );
}

void _setUpAdhkarProgressUseCases() {
  _getIt.registerLazySingleton<GetAllAdhkarProgress>(
    () => GetAllAdhkarProgress(getService<AdhkarProgressRepository>()),
  );
  _getIt.registerLazySingleton<SaveAdhkarProgress>(
    () => SaveAdhkarProgress(getService<AdhkarProgressRepository>()),
  );
}

void _setUpAdhkarProgressBlocs() {
  _getIt.registerLazySingleton<AdhkarProgressCubit>(
    () => AdhkarProgressCubit(
      getAllAdhkarProgress: getService<GetAllAdhkarProgress>(),
      saveAdhkarProgressUseCase: getService<SaveAdhkarProgress>(),
    ),
  );
}

// ============================================================================
// daily_activity_log
// ============================================================================

void _setUpDailyActivityLogDataSources() {
  _getIt.registerLazySingleton<DailyActivityLogLocalDataSource>(
    () => DailyActivityLogLocalDataSourceImpl(
      sharedPreferences: getService<SharedPreferences>(),
    ),
  );
}

void _setUpDailyActivityLogRepositories() {
  _getIt.registerLazySingleton<DailyActivityLogRepository>(
    () => DailyActivityLogRepositoryImpl(
      localDataSource: getService<DailyActivityLogLocalDataSource>(),
    ),
  );
}

void _setUpDailyActivityLogUseCases() {
  _getIt.registerLazySingleton<GetDailyActivityLog>(
    () => GetDailyActivityLog(getService<DailyActivityLogRepository>()),
  );
  _getIt.registerLazySingleton<LogZikrIncrement>(
    () => LogZikrIncrement(getService<DailyActivityLogRepository>()),
  );
  _getIt.registerLazySingleton<MarkAdhkarCompleted>(
    () => MarkAdhkarCompleted(getService<DailyActivityLogRepository>()),
  );
}

void _setUpDailyActivityLogBlocs() {
  _getIt.registerLazySingleton<DailyActivityLogCubit>(
    () => DailyActivityLogCubit(
      getDailyActivityLog: getService<GetDailyActivityLog>(),
      logZikrIncrementUseCase: getService<LogZikrIncrement>(),
      markAdhkarCompletedUseCase: getService<MarkAdhkarCompleted>(),
    ),
  );
}

// ============================================================================
// morning_night_azkar
// ============================================================================

void _setUpMorningNightAzkarDataSources() {
  _getIt.registerLazySingleton<MorningNightAzkarLocalDataSource>(
    () => MorningNightAzkarLocalDataSourceImpl(
      morningAzkarBox:
          getService<Box<MorningOrNightZikr>>(instanceName: 'morningAzkarBox'),
      nightAzkarBox:
          getService<Box<MorningOrNightZikr>>(instanceName: 'nightAzkarBox'),
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
      morningNightDataSource: getService<MorningNightAzkarLocalDataSource>(),
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
