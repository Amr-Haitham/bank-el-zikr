import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../2_state_management/get_all_morning_or_night_azkar_cubit/get_all_morning_or_night_azkar_cubit.dart';
import 'morning_or_night_azkar_screen.dart';

@RoutePage()
class MorningAzkarRoute extends StatelessWidget {
  const MorningAzkarRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllMorningOrNightAzkarCubit(),
      child: const MorningOrNightAzkarScreen(isMorning: true),
    );
  }
}
