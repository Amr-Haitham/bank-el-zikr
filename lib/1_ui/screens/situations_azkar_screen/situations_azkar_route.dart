import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../2_state_management/situational_azkar_cubits/add_or_remove_situational_azkar/handle_fav_situational_azkar_cubit.dart';
import '../../../2_state_management/situational_azkar_cubits/get_conditional_azkar_cubit/get_conditional_azkar_cubit.dart';
import 'situations_azkar_screen.dart';

@RoutePage()
class SituationsAzkarRoute extends StatelessWidget {
  const SituationsAzkarRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetConditionalAzkarCubit()),
        BlocProvider(create: (context) => HandleFavSituationalAzkarCubit()),
      ],
      child: const SituationsAzkarScreen(),
    );
  }
}
