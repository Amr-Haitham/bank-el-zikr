import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/support_cubit.dart';
import 'settings_screen.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<SettingsCubit>()),
        BlocProvider(create: (context) => getService<SupportCubit>()),
      ],
      child: const SettingsScreen(),
    );
  }
}
