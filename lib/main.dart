import 'package:bank_el_ziker/1_ui/core/theme/app_theme.dart';
import 'package:bank_el_ziker/2_state_management/settings/get_settings_cubit/get_settings_cubit.dart';
import 'package:bank_el_ziker/3_data/services/hive_db.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Notifications.init();
  // tz.initializeTimeZones();

  // Notifications.setMorningAzkar(
  //     dateTime: DateTime.now().add(Duration(minutes: 2)));

  // Initialize Hive FIRST (still needed for old architecture during migration)
  await HiveDB.initHiveDB();
  await HiveDB().setupInitHiveDbDataIfNonExisting();

  // Initialize service locator (will grow as we migrate features to clean architecture)
  await setupServiceLocator();

  // await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(BlocProvider(
    create: (context) => GetSettingsCubit(),
    child: MyApp(appRouter: AppRouter()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLightTheme = true;
  @override
  void initState() {
    BlocProvider.of<GetSettingsCubit>(context).getSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetSettingsCubit, GetSettingsState>(
      listener: (context, state) {
        if (state is GetSettingsLoaded) {
          if (isLightTheme != state.isLightTheme) {
            setState(() {
              isLightTheme = state.isLightTheme;
            });
          }
        }
      },
      child: MaterialApp.router(
        locale: const Locale("ar"),
        theme: isLightTheme ? AppTheme.lightTheme : AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: widget.appRouter.config(),
      ),
    );
  }
}