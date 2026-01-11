import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../2_state_management/charity_funds_paypal_cubit/charity_funds_paypal_cubit.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'settings_screen.dart';


class SettingsRoute extends StatelessWidget {
  const SettingsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<SettingsCubit>()),
        BlocProvider(create: (context) => CharityFundsPaypalCubit()),
      ],
      child: const SettingsScreen(),
    );
  }
}
