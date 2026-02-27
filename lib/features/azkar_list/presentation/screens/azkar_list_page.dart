import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/presentation/cubit/morning_night_azkar_cubit.dart';
import 'package:bank_el_ziker/features/situational_azkar/presentation/cubit/situational_azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'azkar_list_screen.dart';

@RoutePage()
class AzkarListPage extends StatelessWidget {
  const AzkarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getService<MorningNightAzkarCubit>()),
        BlocProvider(create: (_) => getService<SituationalAzkarCubit>()),
      ],
      child: const AzkarListScreen(),
    );
  }
}
