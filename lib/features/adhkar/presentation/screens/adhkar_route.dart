import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/zikr_category_cubit.dart';
import 'adhkar_list_screen.dart';

@RoutePage()
class AdhkarPage extends StatelessWidget {
  const AdhkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<ZikrCategoryCubit>()),
      ],
      child: const AdhkarListScreen(),
    );
  }
}
