import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../2_state_management/azkar_records/set_azkar_records/set_azkar_records_cubit.dart';
import '../../../2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import '../../../core/router/shared_cubits.dart';
import 'ziker_screen.dart';

@RoutePage()
class TasbeehWerdRoute extends StatelessWidget {
  const TasbeehWerdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedCubits = SharedCubits();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetGeneralDataCubit()),
        BlocProvider.value(value: sharedCubits.updateGeneralDataCubit),
        BlocProvider.value(value: sharedCubits.azkarCubit),
        BlocProvider.value(value: sharedCubits.getCurrentZikrCubit),
        BlocProvider(
          lazy: false,
          create: (context) => SetAzkarRecordsCubit(),
        ),
      ],
      child: const ZikerScreen(),
    );
  }
}
