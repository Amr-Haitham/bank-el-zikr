import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../2_state_management/charity_funds_paypal_cubit/charity_funds_paypal_cubit.dart';
import '../../../2_state_management/email_us_cubit/email_us_cubit.dart';
import '../../../2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import '../../../2_state_management/get_random_prayer_cubit/get_random_prayer_cubit.dart';
import '../../../2_state_management/settings/set_settings_cubit/set_settings_cubit.dart';
import '../../../core/router/shared_cubits.dart';
import 'settings_screen.dart';

@RoutePage()
class SettingsRoute extends StatelessWidget {
  const SettingsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedCubits = SharedCubits();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sharedCubits.updateGeneralDataCubit),
        BlocProvider(create: (context) => GetGeneralDataCubit()),
        BlocProvider(create: (context) => GetRandomPrayerCubit()),
        BlocProvider(create: (context) => SetSettingsCubit()),
        BlocProvider(create: (context) => CharityFundsPaypalCubit()),
        BlocProvider(create: (context) => EmailUsCubit()),
      ],
      child: const SettingsScreen(),
    );
  }
}
