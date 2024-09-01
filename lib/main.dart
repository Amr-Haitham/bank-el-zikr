import 'package:bank_el_ziker/1_ui/core/theme/app_theme.dart';
import 'package:bank_el_ziker/2_state_management/settings/get_settings_cubit/get_settings_cubit.dart';
import 'package:bank_el_ziker/3_data/services/hijri_date_api.dart';
import 'package:bank_el_ziker/3_data/services/hive_db.dart';
import 'package:bank_el_ziker/app_router.dart';
import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.initHiveDB();
  await HiveDB().setupInitHiveDbDataIfNonExisting();
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
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return BlocListener<GetSettingsCubit, GetSettingsState>(
            listener: (context, state) {
              if (state is GetSettingsLoaded) {
                if (isLightTheme!=state.isLightTheme) {
                  setState(() {
                  isLightTheme = state.isLightTheme;
                });
                }
                
              }
            },
            child: MaterialApp(
                locale: const Locale("ar"),
                theme: isLightTheme? AppTheme.lightTheme:AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: widget.appRouter.generateRouter),
          );
        });
  }
}
