import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import '../cubit/morning_night_azkar_cubit.dart';
import 'morning_or_night_azkar_screen.dart';

@RoutePage()
class MorningAzkarPage extends StatelessWidget {
  const MorningAzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getService<MorningNightAzkarCubit>(),
      child: const MorningOrNightAzkarScreen(isMorning: true),
    );
  }
}
