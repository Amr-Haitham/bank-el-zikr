import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/get_all_azkar_cubit.dart';
import 'ziker_screen.dart';

@RoutePage()
class TasbeehWerdPage extends StatelessWidget {
  const TasbeehWerdPage({super.key});

  @override
  Widget build(BuildContext context) {
    // SettingsCubit and DayRecordCubit are global singletons, already
    // provided at the app root in main.dart — no need to (re)provide them
    // here.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<GetAllAzkarCubit>()),
      ],
      child: const ZikerScreen(),
    );
  }
}
