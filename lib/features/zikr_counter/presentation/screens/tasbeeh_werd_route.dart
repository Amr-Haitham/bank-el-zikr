import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/fix_and_increment_record_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/get_settings_cubit.dart';
import 'ziker_screen.dart';

@RoutePage()
class TasbeehWerdPage extends StatelessWidget {
  const TasbeehWerdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<CounterCubit>()),
        BlocProvider(create: (context) => getService<GetAllAzkarCubit>()),
        BlocProvider(
            create: (context) => getService<FixAndIncrementRecordCubit>()),
        BlocProvider(create: (context) => getService<GetSettingsCubit>()),
      ],
      child: const ZikerScreen(),
    );
  }
}
