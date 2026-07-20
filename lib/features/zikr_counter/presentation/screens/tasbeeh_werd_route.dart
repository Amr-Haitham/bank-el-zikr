import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/fix_and_increment_record_cubit.dart';
import 'ziker_screen.dart';

@RoutePage()
class TasbeehWerdPage extends StatelessWidget {
  const TasbeehWerdPage({super.key});

  @override
  Widget build(BuildContext context) {
    // SettingsCubit is a global singleton, already provided at the app root
    // in main.dart — no need to (re)provide it here.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<GetAllAzkarCubit>()),
        BlocProvider(
            create: (context) => getService<FixAndIncrementRecordCubit>()),
      ],
      child: const ZikerScreen(),
    );
  }
}
