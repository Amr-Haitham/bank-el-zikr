import 'package:bank_el_ziker/3_data/services/hive_db.dart';
import 'package:bank_el_ziker/app_router.dart';
import 'package:bank_el_ziker/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveDB.initHiveDB();
  await HiveDB().setupInitHiveDbDataIfNonExisting();
  // await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp(appRouter: AppRouter()));
  // TestClassFormorningornightazkar.GetAllMorningOrNightAzkar(
  //     isMorningZikr: true);

  // GetConditionalAzkarCubit x = GetConditionalAzkarCubit();
  // x.getConditionalAzkar();
  //  GetRandomPrayerCubit x = GetRandomPrayerCubit();
  //  x.getPrayer();

  // GetAllMorningOrNightAzkarCubit x = GetAllMorningOrNightAzkarCubit();
  // x.getAllMorningOrNightAzkar(isMorningZikr: false);
  // AddCustomZikrCubit x = AddCustomZikrCubit();
  // x.addCustomZikr(
  //     zikr: Zikr(id: 0, content: "content", description: "description"));
  // // x.addCustomZikr(
  // //     zikr: Zikr(id: 0, content: "content", description: "description"));
  // // x.addCustomZikr(
  // //     zikr: Zikr(id: 0, content: "content", description: "description"));
  // // DeleteCustomZikrCubit s = DeleteCustomZikrCubit();
  // // s.deleteCustomZikr(zikrIndex: 13);
  // UpdateCustomZikrCubit v = UpdateCustomZikrCubit();
  // v.updateCustomZikr(
  //     zikr: Zikr(id: 01, content: "content", description: "description"),
  //     zikrIndex: 17);

  // AzkarCubit azkarCubit = AzkarCubit();
  // azkarCubit.getAllAzkar();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          return MaterialApp(
              theme: ThemeData(
                  fontFamily: 'Cairo',
                  textSelectionTheme: TextSelectionThemeData(
                      cursorColor: appGreen,
                      selectionHandleColor: appGreen,
                      selectionColor: appDarkTextColor.withOpacity(.4))),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRouter);
        });
  }
}
