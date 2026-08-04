import 'package:flutter/material.dart';
import 'package:bank_el_ziker/core/domain/entities/zikr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/features/home/presentation/screens/home_route.dart';
import 'package:bank_el_ziker/features/home/presentation/screens/dashboard_route.dart';
import 'package:bank_el_ziker/features/settings/presentation/screens/settings_route.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/screens/zikr_category_route.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/screens/zikr_content_route.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/screens/tasbeeh_werd_route.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/screens/adhkar_route.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/screens/select_zikr_route.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/screens/daily_azkar_route.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/screens/account_balance_route.dart';
import 'package:bank_el_ziker/features/onboarding/presentation/screens/onboarding_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({this.showOnboarding = false});

  final bool showOnboarding;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardingRoute.page, initial: showOnboarding),
        AutoRoute(
          page: DashboardRoute.page,
          initial: !showOnboarding,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: TasbeehWerdRoute.page),
            AutoRoute(page: AdhkarRoute.page),
            AutoRoute(page: AccountBalanceRoute.page),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
        AutoRoute(page: ZikrCategoryRoute.page),
        AutoRoute(page: ZikrContentRoute.page),
        AutoRoute(page: DailyAzkarRoute.page),
        AutoRoute(page: SelectZikrRoute.page),
      ];
}
