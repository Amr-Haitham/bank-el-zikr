import 'dart:io';

import 'package:bank_el_ziker/core/constants/third_party_values.dart';
import 'package:bank_el_ziker/core/theme/app_theme.dart';
import 'package:bank_el_ziker/features/notifications/data/datasources/notification_local_datasource.dart';
import 'package:bank_el_ziker/features/notifications/domain/usecases/schedule_adhkar_reminders.dart';
import 'package:bank_el_ziker/features/donations/presentation/cubit/supporter_status_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/reading_progress_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/day_record_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

const bool useDevicePreview =
    bool.fromEnvironment('DEVICE_PREVIEW', defaultValue: false);

Future<void> _initRevenueCat() async {
  final apiKey = !kIsWeb && Platform.isIOS
      ? ThirdPartyValues.revenueCatApiKeyIOS
      : ThirdPartyValues.revenueCatApiKeyAndroid;

  if (apiKey.isEmpty) return;

  await Purchases.configure(PurchasesConfiguration(apiKey));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (details) => const SizedBox.shrink();

  // Initialize Hive (still needed for local data sources)
  await HiveDB.initHiveDB();
  await HiveDB().setupInitHiveDbDataIfNonExisting();

  await _initRevenueCat();

  // Initialize service locator
  await setupServiceLocator();

  // Notifications need to know the device's IANA timezone (e.g. "Africa/Cairo")
  // so scheduled reminders fire at the correct local time.
  tz_data.initializeTimeZones();
  final timezoneName = await FlutterTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timezoneName));
  await getService<NotificationLocalDataSource>().init();

  // Re-schedule any pending Adhkar reminders on every cold start, since auto
  // mode's schedule only covers a rolling window of upcoming days.
  await getService<ScheduleAdhkarReminders>()(const NoParams());

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final hasSeenOnboarding =
      getService<SharedPreferences>().getBool('hasSeenOnboarding') ?? false;

  final app = MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getService<SettingsCubit>()),
      BlocProvider.value(value: getService<CounterCubit>()),
      BlocProvider.value(value: getService<ReadingProgressCubit>()),
      BlocProvider.value(value: getService<DayRecordCubit>()),
      BlocProvider.value(value: getService<SupporterStatusCubit>()),
    ],
    child: MyApp(
      appRouter: AppRouter(showOnboarding: !hasSeenOnboarding),
    ),
  );

  runApp(
    useDevicePreview
        ? DevicePreview(enabled: true, builder: (context) => app)
        : app,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  static const _textSizeScales = {
    'small': 0.9,
    'medium': 1.0,
    'large': 1.15,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, RequestState<Settings>>(
      builder: (context, state) {
        final settings = state.whenOrNull(success: (s) => s);
        final isLightTheme = settings?.isLightTheme ?? true;
        final dhikrFont = settings?.dhikrFont ?? 'clear';
        final textSize = settings?.textSize ?? 'medium';

        final baseTheme =
            isLightTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
        // 'clear' uses the app's default Tajawal font; 'uthmani' switches to
        // Cairo, the closest bundled alternative — there's no true Uthmani
        // calligraphic Quran font asset shipped with the app.
        final fontFamily = dhikrFont == 'uthmani' ? 'Cairo' : 'Tajawal';
        final theme = baseTheme.copyWith(
          textTheme: baseTheme.textTheme.apply(fontFamily: fontFamily),
          primaryTextTheme:
              baseTheme.primaryTextTheme.apply(fontFamily: fontFamily),
        );

        final textScale = _textSizeScales[textSize] ?? 1.0;
        final locale = Locale(settings?.selectedLanguage ?? 'ar');

        return MaterialApp.router(
          locale: useDevicePreview ? DevicePreview.locale(context) : locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: theme,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
          builder: (context, child) {
            final withTextScale = MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.linear(textScale)),
              child: child!,
            );
            return useDevicePreview
                ? DevicePreview.appBuilder(context, withTextScale)
                : withTextScale;
          },
        );
      },
    );
  }
}
