import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/get_week_azkar_records_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/get_counter_state_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/week_azkar_record.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/title_with_back_button.dart';
import 'components/azkar_weekly_record_chart.dart';

class AccountBalanceScreen extends StatelessWidget {
  const AccountBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                child: TitleWithBackButton(
                  title: "رصيد الذكر",
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 34),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantValues.appHorizontalPadding * 2),
                  child: AutoSizeText(
                    "وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُمْ مَغْفِرَةً وَأَجْرًا عَظِيمًا",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontFamily: "Arial",
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 42),
              ),
              const SliverToBoxAdapter(child: TotalBalanceNumber()),
              const SliverToBoxAdapter(
                child: SizedBox(height: 48),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: ScreenUtils.getScreenHeight(context) / 5.5,
                  child: BlocBuilder<GetWeekAzkarRecordsCubit,
                      RequestState<WeekAzkarRecord>>(
                    builder: (context, state) {
                      return state.when(
                        initial: () =>
                            const Center(child: CircularProgressIndicator()),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        success: (weekRecord) => LineChartForDayRecords(
                          records: weekRecord.dailyRecords,
                        ),
                        failure: (failure) => const SizedBox.shrink(),
                      );
                    },
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 42),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<GetWeekAzkarRecordsCubit,
                    RequestState<WeekAzkarRecord>>(
                  builder: (context, recordsState) {
                    return BlocBuilder<GetAllAzkarCubit,
                        RequestState<List<ZikrEntity>>>(
                      builder: (context, azkarState) {
                        return recordsState.when(
                          initial: () =>
                              const Center(child: CircularProgressIndicator()),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          success: (records) {
                            return azkarState.when(
                              initial: () => const Center(
                                  child: CircularProgressIndicator()),
                              loading: () => const Center(
                                  child: CircularProgressIndicator()),
                              success: (azkar) => TabbarOfAzkarRecord(
                                screenWidth: screenWidth,
                                allWeekAzkarRecordsById:
                                    records.totalCountsByZikrId,
                                firstDayAzkarRecord:
                                    records.todayCountsByZikrId,
                                allAzkar: azkar,
                              ),
                              failure: (failure) => const Center(
                                  child: Text("Error loading azkar")),
                            );
                          },
                          failure: (failure) => const Center(
                              child: Text("Error loading records")),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TabbarOfAzkarRecord extends StatefulWidget {
  const TabbarOfAzkarRecord(
      {super.key,
      required this.screenWidth,
      required this.allWeekAzkarRecordsById,
      required this.firstDayAzkarRecord,
      required this.allAzkar});
  final Map<int, int> allWeekAzkarRecordsById;
  final Map<int, int> firstDayAzkarRecord;
  final List<ZikrEntity> allAzkar;
  final double screenWidth;

  @override
  State<TabbarOfAzkarRecord> createState() => _TabbarOfAzkarRecordState();
}

class _TabbarOfAzkarRecordState extends State<TabbarOfAzkarRecord> {
  List<ZikrEntity> getSortedFilteredAzkar(Map<int, int> mapAzkarRecord) {
    List<ZikrEntity> filteredAzkar = widget.allAzkar.where((zikr) {
      int? recordValue = mapAzkarRecord[zikr.id];
      return recordValue != null && recordValue != 0;
    }).toList();

    filteredAzkar.sort((a, b) {
      int valueA = mapAzkarRecord[a.id] ?? 0;
      int valueB = mapAzkarRecord[b.id] ?? 0;
      return valueB.compareTo(valueA);
    });

    return filteredAzkar;
  }

  @override
  Widget build(BuildContext context) {
    final dailyAzkar = getSortedFilteredAzkar(widget.firstDayAzkarRecord);
    final weeklyAzkar = getSortedFilteredAzkar(widget.allWeekAzkarRecordsById);

    // Calculate required height based on the larger list
    final maxItems = dailyAzkar.length > weeklyAzkar.length
        ? dailyAzkar.length
        : weeklyAzkar.length;
    final viewHeight = maxItems == 0 ? 100.0 : maxItems * 81.0;

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(42),
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
              indicator: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(42),
              ),
              labelColor:
                  GeneralUtils.isLightTheme(context) ? appWhite : appDark,
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              unselectedLabelColor:
                  GeneralUtils.isLightTheme(context) ? appDark : appWhite,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
              tabs: const [
                SizedBox(
                  width: double.infinity,
                  child: Tab(text: "يومي"),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Tab(text: "اسبوعي"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: viewHeight,
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                _AzkarListView(
                  records: widget.firstDayAzkarRecord,
                  sortedAzkar: dailyAzkar,
                ),
                _AzkarListView(
                  records: widget.allWeekAzkarRecordsById,
                  sortedAzkar: weeklyAzkar,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AzkarListView extends StatelessWidget {
  final Map<int, int> records;
  final List<ZikrEntity> sortedAzkar;

  const _AzkarListView({
    required this.records,
    required this.sortedAzkar,
  });

  @override
  Widget build(BuildContext context) {
    if (sortedAzkar.isEmpty) {
      return Center(
        child: Text(
          "لم يتم العثور على أي إحداثيات",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.red),
        ),
      );
    }

    return Column(
      children: sortedAzkar.map((azkar) {
        int value = records[azkar.id] ?? 0;

        return Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          margin: const EdgeInsets.only(bottom: 20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border.all(width: 1, color: appGray),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value != 0 ? ArabicNumbers().convert(value) : "-",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  azkar.content,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class TotalBalanceNumber extends StatelessWidget {
  const TotalBalanceNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<GetCounterStateCubit, RequestState<CounterStateEntity>>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (counter) => AutoSizeText(
                  ArabicNumbers().convert(counter.accountBalance),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                failure: (failure) => const Text("Error"),
              );
            },
          ),
          Text(
            "رصيد الذكر",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
