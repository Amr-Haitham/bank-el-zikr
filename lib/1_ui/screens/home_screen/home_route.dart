import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import '../../../2_state_management/get_random_prayer_cubit/get_random_prayer_cubit.dart';
import '../../../core/router/shared_cubits.dart';
import 'home_screen.dart';

@RoutePage()
class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedCubits = SharedCubits();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sharedCubits.updateGeneralDataCubit),
        BlocProvider(create: (context) => GetGeneralDataCubit()),
        BlocProvider(create: (context) => GetRandomPrayerCubit()),
      ],
      child: const HomeScreen(),
    );
  }
}
