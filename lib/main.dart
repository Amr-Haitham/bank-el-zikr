import 'package:bank_el_ziker/core/theme/app_theme.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/data/services/hive_db.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/adhkar_progress_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/daily_activity_log_cubit.dart';
import 'package:bank_el_ziker/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive (still needed for local data sources)
  await HiveDB.initHiveDB();
  await HiveDB().setupInitHiveDbDataIfNonExisting();

  // Initialize service locator
  await setupServiceLocator();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<SettingsCubit>()),
        BlocProvider.value(value: getService<CounterCubit>()),
        BlocProvider.value(value: getService<AdhkarProgressCubit>()),
        BlocProvider.value(value: getService<DailyActivityLogCubit>()),
      ],
      child: MyApp(appRouter: AppRouter()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, RequestState<Settings>>(
      builder: (context, state) {
        final isLightTheme =
            state.whenOrNull(success: (s) => s.isLightTheme) ?? true;
        final locale =
            state.whenOrNull(success: (s) => s.locale) ?? const Locale('ar');

        return MaterialApp.router(
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: isLightTheme ? AppTheme.lightTheme : AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
        );
      },
    );
  }
}
