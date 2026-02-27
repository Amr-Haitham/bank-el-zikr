import 'package:flutter/material.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/presentation/main_shell_page.dart';
import 'package:bank_el_ziker/features/home/presentation/screens/home_route.dart';
import 'package:bank_el_ziker/features/settings/presentation/screens/settings_route.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/presentation/screens/morning_azkar_route.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/presentation/screens/night_azkar_route.dart';
import 'package:bank_el_ziker/features/situational_azkar/presentation/screens/situations_azkar_route.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/screens/zikr_content_route.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/screens/tasbeeh_werd_route.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/screens/azkar_route.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/screens/daily_azkar_route.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/screens/account_balance_route.dart';
import 'package:bank_el_ziker/features/azkar_list/presentation/screens/azkar_list_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainShellRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: AccountBalanceRoute.page),
            AutoRoute(page: TasbeehWerdRoute.page),
            AutoRoute(page: AzkarListRoute.page),
          ],
        ),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: MorningAzkarRoute.page),
        AutoRoute(page: NightAzkarRoute.page),
        AutoRoute(page: SituationsAzkarRoute.page),
        AutoRoute(page: ZikrContentRoute.page),
        AutoRoute(page: AzkarRoute.page),
        AutoRoute(page: DailyAzkarRoute.page),
      ];
}
