import 'package:bank_el_ziker/1_ui/screens/account_balance_screen/account_balance_screen.dart';
import 'package:bank_el_ziker/1_ui/screens/azkar_screen/azkar_screen.dart';
import 'package:bank_el_ziker/1_ui/screens/azkar_screen/sub_screens/adding_new_ziker_screen.dart';
import 'package:bank_el_ziker/1_ui/screens/azkar_screen/sub_screens/edit_custom_ziker_screen.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/home_screen.dart';
import 'package:bank_el_ziker/1_ui/screens/welcome_screen/welcome_screen.dart';
import 'package:bank_el_ziker/1_ui/screens/zikr_content_screen/zikr_content_screen.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/delete_single_zikr_record/delete_single_zikr_record_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/get_week_azkar_record/get_week_azkar_record_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/set_azkar_records/set_azkar_records_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/delete_custom_zikr_cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/update_custom_zikr/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:bank_el_ziker/2_state_management/get_conditional_azkar_cubit/get_conditional_azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/get_random_prayer_cubit/get_random_prayer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_el_ziker/1_ui/screens/ziker_screen/ziker_screen.dart';
import '1_ui/screens/morning_and_night_azkar_screens/morning_azkar_screen/morning_azkar_screen.dart';
import '1_ui/screens/morning_and_night_azkar_screens/night_azkar_screen/night_azkar_screen.dart';
import '1_ui/screens/situations_azkar_screen/situations_azkar_screen.dart';
import '2_state_management/custom_azkar_cubits/add_custom_zikr_cubit/add_custom_zikr_cubit.dart';
import '2_state_management/general_data/get_current_zikr/get_current_zikr_cubit.dart';
import '2_state_management/get_all_morning_or_night_azkar_cubit/get_all_morning_or_night_azkar_cubit.dart';
import '3_data/models/zikr.dart';

const welcomeScreenUrl = "welcomScreen";
const homeScreen = "/";
const azkarScreenUrl = "/azkarScreenUrl";
const zikerScreen = "zikerScreen";
const accountBalanceUrl = "/accountBalanceUrl";
// const landingScreen = '/';
// const animatedSecondScreen = '/';
const morningAzkarScreen = 'morningAzkarScreen';
const nightAzkarScreen = 'nightAzkarScreen';
const tasbeehWerdScreen = 'tasbeehWerdScreen';
const dailyAzkarScreen = 'dailyAzkarScreen';
const situationsAzkarScreen = 'conditionalAzkarScreen';
const zikrContentScreen = 'zikrContentScreen';
const addNewZikrScreen = 'addNewZikrScreen';
const editCustomZikrScreen = 'editCustomZikrScreen';

class AppRouter {
  final GetCurrentZikrCubit _getCurrentZikrCubit = GetCurrentZikrCubit();
  final UpdateGeneralDataCubit _updateGeneralDataCubit =
      UpdateGeneralDataCubit();
  final AzkarCubit _azkarCubit = AzkarCubit();

  final AddCustomZikrCubit _addCustomZikrCubit = AddCustomZikrCubit();
  Route? generateRouter(RouteSettings settings, {Object? arguments}) {
    switch (settings.name) {
      // case welcomeScreenUrl:
      //   return MaterialPageRoute(builder: (context) {
      //     return const WelcomeScreen();
      //   });

      // case landingScreen:
      //   return MaterialPageRoute(builder: (context) {
      //     return const LandingScreen();
      //   });

      // case animatedSecondScreen:
      //   return MaterialPageRoute(builder: (context) {
      //     return const AnimatedSecondScreen();
      //   });

      case homeScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _updateGeneralDataCubit),
              BlocProvider(
                create: (context) => GetGeneralDataCubit(),
              ),
              BlocProvider(
                create: (context) => GetRandomPrayerCubit(),
              ),
            ],
            child: const HomeScreen(),
          );
        });

      case morningAzkarScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => GetAllMorningOrNightAzkarCubit(),
            child: const MorningAzkarScreen(),
          );
        });

      case nightAzkarScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => GetAllMorningOrNightAzkarCubit(),
            child: const NightAzkarScreen(),
          );
        });

      case situationsAzkarScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => GetConditionalAzkarCubit(),
            child:  const SituationsAzkarScreen(),
          );
        });

      case zikrContentScreen:
        if (arguments != null && arguments is Zikr) {
          return MaterialPageRoute(builder: (context) {
            return ZikrContentScreen(zikr: arguments);
          });
        }

      case addNewZikrScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(providers: [
            BlocProvider.value(value: _addCustomZikrCubit),
          ], child: const AddNewZikrScreen());
        });
      case editCustomZikrScreen:
        final List isSelectedThenindexThenZikr = settings.arguments as List;

        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => UpdateCustomZikrCubit(),
                ),
                BlocProvider(
                  create: (context) => DeleteCustomZikrCubit(),
                ),
                BlocProvider(
                  create: (context) => DeleteSingleZikrRecordCubit(),
                ),
                BlocProvider.value(value: _updateGeneralDataCubit),
                BlocProvider.value(value: _azkarCubit),

              ],
              child: EditCustomZikerScreen(
                isSelected: isSelectedThenindexThenZikr[0],
                zikrIndex: isSelectedThenindexThenZikr[1],
                zikr: isSelectedThenindexThenZikr[2],
              ));
        });

      case zikerScreen:
      case tasbeehWerdScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetGeneralDataCubit(),
              ),
              BlocProvider.value(value: _updateGeneralDataCubit),
              BlocProvider.value(
                value: _azkarCubit,
              ),
              BlocProvider.value(
                value: _getCurrentZikrCubit,
              ),
              BlocProvider(
                lazy: false,
                create: (context) => SetAzkarRecordsCubit(),
              ),
            ],
            child: const ZikerScreen(),
          );
        });
      case azkarScreenUrl:
      case dailyAzkarScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _azkarCubit,
              ),
              BlocProvider.value(
                value: _updateGeneralDataCubit,
              ),
              BlocProvider.value(value: _getCurrentZikrCubit),
              BlocProvider.value(value: _addCustomZikrCubit),
            ],
            child: const AzkarScreen(),
          );
        });
      case accountBalanceUrl:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GetGeneralDataCubit(),
              ),
              BlocProvider(
                create: (context) => GetWeekAzkarRecordCubit(),
              ),
              BlocProvider(
                create: (context) => AzkarCubit(),
              ),
            ],
            child: const AccountBalanceScreen(),
          );
        });
    }

    return null;
  }
}
