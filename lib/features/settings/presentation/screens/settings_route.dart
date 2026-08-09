import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/notifications/presentation/cubit/prayer_times_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_screen.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // SettingsCubit is a global singleton, already provided at the app root
    // in main.dart — no need to (re)provide it here.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<PrayerTimesCubit>()),
      ],
      child: const SettingsScreen(),
    );
  }
}
