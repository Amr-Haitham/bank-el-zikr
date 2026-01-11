import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../2_state_management/azkar_cubit/azkar_cubit.dart';
import '../../../2_state_management/azkar_records/get_week_azkar_record/get_week_azkar_record_cubit.dart';
import '../../../2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import 'account_balance_screen.dart';

@RoutePage()
class AccountBalanceRoute extends StatelessWidget {
  const AccountBalanceRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetGeneralDataCubit()),
        BlocProvider(create: (context) => GetWeekAzkarRecordCubit()),
        BlocProvider(create: (context) => AzkarCubit()),
      ],
      child: const AccountBalanceScreen(),
    );
  }
}
