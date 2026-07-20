import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/main_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        TasbeehWerdRoute(),
        AzkarRoute(),
        AccountBalanceRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: MainBottomNavBar(tabsRouter: tabsRouter),
        );
      },
    );
  }
}
