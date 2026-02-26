import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/add_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/get_counter_state_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/update_current_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/azkar_records_cubit.dart';
import 'azkar_screen.dart';

@RoutePage()
class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<GetAllAzkarCubit>()),
        BlocProvider(create: (context) => getService<AddCustomZikrCubit>()),
        BlocProvider(create: (context) => getService<UpdateCustomZikrCubit>()),
        BlocProvider(create: (context) => getService<DeleteCustomZikrCubit>()),
        BlocProvider(create: (context) => getService<CounterCubit>()),
        BlocProvider(create: (context) => getService<GetCounterStateCubit>()),
        BlocProvider(create: (context) => getService<UpdateCurrentZikrCubit>()),
        BlocProvider(create: (context) => getService<AzkarRecordsCubit>()),
      ],
      child: const AzkarScreen(),
    );
  }
}
