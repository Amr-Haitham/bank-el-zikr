import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/get_week_azkar_records_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/week_azkar_record.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/title_with_back_button.dart';
import 'components/azkar_weekly_record_chart.dart';
import 'components/total_balance_number.dart';
import 'components/azkar_record_tabbar.dart';

class AccountBalanceScreen extends StatelessWidget {
  const AccountBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(
              top: ConstantValues.appTopPadding,
              left: ConstantValues.appHorizontalPadding,
              right: ConstantValues.appHorizontalPadding),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: TitleWithBackButton(title: "رصيد الذكر"),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 34)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantValues.appHorizontalPadding * 2),
                  child: AutoSizeText(
                    "وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُمْ مَغْفِرَةً وَأَجْرًا عَظِيمًا",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: "Arial",
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 42)),
              const SliverToBoxAdapter(child: TotalBalanceNumber()),
              const SliverToBoxAdapter(child: SizedBox(height: 48)),
              SliverToBoxAdapter(
                child: _buildWeeklyChart(context),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 42)),
              SliverToBoxAdapter(
                child: _buildRecordsTabbar(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeeklyChart(BuildContext context) {
    return SizedBox(
      height: ScreenUtils.getScreenHeight(context) / 5.5,
      child: BlocBuilder<GetWeekAzkarRecordsCubit,
          RequestState<WeekAzkarRecord>>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (weekRecord) => LineChartForDayRecords(
              records: weekRecord.dailyRecords,
            ),
            failure: (failure) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildRecordsTabbar(BuildContext context) {
    return BlocBuilder<GetWeekAzkarRecordsCubit,
        RequestState<WeekAzkarRecord>>(
      builder: (context, recordsState) {
        return BlocBuilder<GetAllAzkarCubit, RequestState<List<ZikrEntity>>>(
          builder: (context, azkarState) {
            return recordsState.when(
              initial: () =>
                  const Center(child: CircularProgressIndicator()),
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              success: (records) {
                return azkarState.when(
                  initial: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  success: (azkar) => TabbarOfAzkarRecord(
                    allWeekAzkarRecordsById: records.totalCountsByZikrId,
                    firstDayAzkarRecord: records.todayCountsByZikrId,
                    allAzkar: azkar,
                  ),
                  failure: (failure) =>
                      const Center(child: Text("Error loading azkar")),
                );
              },
              failure: (failure) =>
                  const Center(child: Text("Error loading records")),
            );
          },
        );
      },
    );
  }
}
