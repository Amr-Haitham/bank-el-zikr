import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/day_record_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/get_week_azkar_records_cubit.dart';
import 'package:bank_el_ziker/features/home/presentation/cubit/get_random_prayer_cubit.dart';
import 'package:bank_el_ziker/features/notifications/presentation/cubit/prayer_times_cubit.dart';
import 'home_screen.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getService<GetRandomPrayerCubit>()),
        BlocProvider(
            create: (context) => getService<GetWeekAzkarRecordsCubit>()),
        BlocProvider(create: (context) => getService<PrayerTimesCubit>()),
        BlocProvider.value(value: getService<DayRecordCubit>()),
      ],
      child: const HomeScreen(),
    );
  }
}
