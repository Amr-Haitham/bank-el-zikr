import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/azkar_records_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/azkar_cubit.dart';
import 'account_balance_screen.dart';

@RoutePage()
class AccountBalanceRoute extends StatelessWidget {
  const AccountBalanceRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<CounterCubit>()),
        BlocProvider(create: (context) => getService<AzkarRecordsCubit>()),
        BlocProvider(create: (context) => getService<AzkarCubit>()),
      ],
      child: const AccountBalanceScreen(),
    );
  }
}
