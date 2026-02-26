import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/situational_azkar/presentation/cubit/situational_azkar_cubit.dart';
import 'situations_azkar_screen.dart';

@RoutePage()
class SituationsAzkarPage extends StatelessWidget {
  const SituationsAzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getService<SituationalAzkarCubit>(),
      child: const SituationsAzkarScreen(),
    );
  }
}
