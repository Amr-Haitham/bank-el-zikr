import 'package:bank_el_ziker/1_ui/screens/account_balance_screen/account_balance_screen.dart';
import 'package:bank_el_ziker/1_ui/screens/azkar_screen/azkar_screen.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/home_screen.dart';
import 'package:bank_el_ziker/2_state_management/charity_funds_paypal_cubit/charity_funds_paypal_cubit.dart';
import 'package:bank_el_ziker/2_state_management/email_us_cubit/email_us_cubit.dart';
import 'package:bank_el_ziker/1_ui/screens/zikr_content_screen/zikr_content_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_el_ziker/1_ui/screens/ziker_screen/ziker_screen.dart';
import '1_ui/screens/morning_and_night_azkar_screens/morning_or_night_azkar_screen.dart';
import '1_ui/screens/settings_screen/settings_screen.dart';
import '1_ui/screens/situations_azkar_screen/situations_azkar_screen.dart';
import '3_data/models/zikr.dart';

// Clean Architecture imports
import 'core/di/service_locator.dart';
import 'features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'features/azkar_management/presentation/cubit/azkar_cubit.dart';
import 'features/azkar_records/presentation/cubit/azkar_records_cubit.dart';
import 'features/morning_night_azkar/presentation/cubit/morning_night_azkar_cubit.dart';
import 'features/situational_azkar/presentation/cubit/situational_azkar_cubit.dart';
import 'features/settings/presentation/cubit/settings_cubit.dart';
import 'features/home/presentation/cubit/home_cubit.dart';

const welcomeScreenUrl = "welcomScreen";
const homeScreen = "/";
const azkarScreenUrl = "/azkarScreenUrl";
const accountBalanceUrl = "/accountBalanceUrl";
const morningAzkarScreen = 'morningAzkarScreen';
const nightAzkarScreen = 'nightAzkarScreen';
const tasbeehWerdScreen = 'tasbeehWerdScreen';
const dailyAzkarScreen = 'dailyAzkarScreen';
const situationsAzkarScreen = 'conditionalAzkarScreen';
const zikrContentScreen = 'zikrContentScreen';
const settingsScreenUrl = 'settingsScreenUrl';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getService<CounterCubit>()),
              BlocProvider(create: (_) => getService<HomeCubit>()),
            ],
            child: const HomeScreen(),
          );
        });

      case settingsScreenUrl:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getService<SettingsCubit>()),
              BlocProvider(create: (_) => CharityFundsPaypalCubit()),
              BlocProvider(create: (_) => EmailUsCubit()),
            ],
            child: const SettingsScreen(),
          );
        });

      case morningAzkarScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (_) => getService<MorningNightAzkarCubit>(),
            child: const MorningOrNightAzkarScreen(isMorning: true),
          );
        });

      case nightAzkarScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (_) => getService<MorningNightAzkarCubit>(),
            child: const MorningOrNightAzkarScreen(isMorning: false),
          );
        });

      case situationsAzkarScreen:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (_) => getService<SituationalAzkarCubit>(),
            child: const SituationsAzkarScreen(),
          );
        });

      case zikrContentScreen:
        if (settings.arguments != null && settings.arguments is Zikr) {
          return MaterialPageRoute(builder: (context) {
            return ZikrContentScreen(zikr: settings.arguments as Zikr);
          });
        }
        break;

      case tasbeehWerdScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getService<CounterCubit>()),
              BlocProvider(create: (_) => getService<AzkarCubit>()),
              BlocProvider(create: (_) => getService<AzkarRecordsCubit>()),
              BlocProvider(create: (_) => getService<SettingsCubit>()),
            ],
            child: const ZikerScreen(),
          );
        });

      case azkarScreenUrl:
      case dailyAzkarScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getService<AzkarCubit>()),
              BlocProvider(create: (_) => getService<CounterCubit>()),
            ],
            child: const AzkarScreen(),
          );
        });

      case accountBalanceUrl:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => getService<CounterCubit>()),
              BlocProvider(create: (_) => getService<AzkarRecordsCubit>()),
              BlocProvider(create: (_) => getService<AzkarCubit>()),
            ],
            child: const AccountBalanceScreen(),
          );
        });
    }

    return null;
  }
}
