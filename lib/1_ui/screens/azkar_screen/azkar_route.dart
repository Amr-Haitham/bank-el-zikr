import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/shared_cubits.dart';
import 'azkar_screen.dart';

@RoutePage()
class AzkarRoute extends StatelessWidget {
  const AzkarRoute({super.key});

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
