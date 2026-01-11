import 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: MorningAzkarRoute.page),
        AutoRoute(page: NightAzkarRoute.page),
        AutoRoute(page: SituationsAzkarRoute.page),
        AutoRoute(page: ZikrContentRoute.page),
        AutoRoute(page: TasbeehWerdRoute.page),
        AutoRoute(page: AzkarRoute.page),
        AutoRoute(page: DailyAzkarRoute.page),
        AutoRoute(page: AccountBalanceRoute.page),
      ];
}
