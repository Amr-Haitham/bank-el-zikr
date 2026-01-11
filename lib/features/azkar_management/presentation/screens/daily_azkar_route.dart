import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'azkar_screen.dart';

@RoutePage()
class DailyAzkarRoute extends StatelessWidget {
  const DailyAzkarRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<AzkarCubit>()),
        BlocProvider(create: (context) => getService<CounterCubit>()),
      ],
      child: const AzkarScreen(),
    );
  }
}
