import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/router/shared_cubits.dart';
import 'azkar_screen.dart';


class DailyAzkarRoute extends StatelessWidget {
  const DailyAzkarRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedCubits = SharedCubits();

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: sharedCubits.azkarCubit),
        BlocProvider.value(value: sharedCubits.updateGeneralDataCubit),
        BlocProvider.value(value: sharedCubits.getCurrentZikrCubit),
        BlocProvider.value(value: sharedCubits.addCustomZikrCubit),
      ],
      child: const AzkarScreen(),
    );
  }
}
