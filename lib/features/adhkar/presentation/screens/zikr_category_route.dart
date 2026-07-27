import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/morning_night_azkar_cubit.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/zikr_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'zikr_category_screen.dart';

/// The one shared reading-screen route every category on the Adhkar List
/// pushes to — morning, evening, sleep, ruqyah, after-prayer, and every
/// other situational category alike.
@RoutePage()
class ZikrCategoryPage extends StatelessWidget {
  const ZikrCategoryPage({
    super.key,
    required this.category,
    required this.title,
  });

  final String category;
  final String title;

  @override
  Widget build(BuildContext context) {
    final isMorningOrEvening = category == 'morning' || category == 'evening';

    return BlocProvider<RequestCubit<List<ZikrEntity>>>(
      create: (context) {
        if (isMorningOrEvening) {
          final cubit = getService<MorningNightAzkarCubit>();
          if (category == 'morning') {
            cubit.loadMorningAzkar();
          } else {
            cubit.loadNightAzkar();
          }
          return cubit;
        }
        return getService<ZikrCategoryCubit>()..load(category);
      },
      child: ZikrCategoryScreen(category: category, title: title),
    );
  }
}
