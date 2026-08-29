import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/get_all_azkar_cubit.dart';
import 'account_balance_screen.dart';

@RoutePage()
class AccountBalancePage extends StatelessWidget {
  const AccountBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getService<GetAllAzkarCubit>(),
      child: const AccountBalanceScreen(),
    );
  }
}
