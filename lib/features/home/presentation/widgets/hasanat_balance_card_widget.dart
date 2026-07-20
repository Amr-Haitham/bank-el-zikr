import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/week_azkar_record.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/get_week_azkar_records_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HasanatBalanceCardWidget extends StatelessWidget {
  const HasanatBalanceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -40,
              left: -40,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Theme.of(context).primaryColor.withValues(alpha: 0.12),
                      Theme.of(context).primaryColor.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).totalHasanatBalance,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .color!
                                  .withValues(alpha: 0.6),
                            ),
                      ),
                      const SizedBox(width: 6),
                      Icon(
                        Icons.credit_card_outlined,
                        size: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .color!
                            .withValues(alpha: 0.6),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  BlocBuilder<CounterCubit, RequestState<CounterStateEntity>>(
                    builder: (context, state) {
                      final balance =
                          state.whenOrNull(success: (s) => s.accountBalance) ??
                              0;
                      return Text(
                        formatNumber(context, balance),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: 36),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<GetWeekAzkarRecordsCubit,
                      RequestState<WeekAzkarRecord>>(
                    builder: (context, state) {
                      final depositedToday = state.whenOrNull(
                            success: (record) => record
                                .todayCountsByZikrId.values
                                .fold<int>(0, (sum, v) => sum + v),
                          ) ??
                          0;
                      if (depositedToday <= 0) return const SizedBox.shrink();
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          AppLocalizations.of(context).depositedToday(
                              formatNumber(context, depositedToday)),
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      AutoTabsRouter.of(context).setActiveIndex(1);
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        AppLocalizations.of(context).depositMore,
                        strutStyle: const StrutStyle(
                          fontSize: 16,
                          height: 1,
                          forceStrutHeight: true,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
