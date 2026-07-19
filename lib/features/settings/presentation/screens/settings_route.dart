import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'settings_screen.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // SettingsCubit is a global singleton, already provided at the app root
    // in main.dart — no need to (re)provide it here.
    return const SettingsScreen();
  }
}
