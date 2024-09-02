import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/1_ui/core/consts/constant_values.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/get_week_azkar_record/get_week_azkar_record_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import 'package:bank_el_ziker/4_utility_functions/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../3_data/models/zikr.dart';
import '../../core/consts/colors.dart';
import '../../core/consts/text_styles.dart';
import '../../re-usable widgets/title_with_back_button.dart';
import 'components/azkar_weekly_record_chart.dart';

class AccountBalanceScreen extends StatefulWidget {
  const AccountBalanceScreen({super.key});

  @override
  State<AccountBalanceScreen> createState() => _AccountBalanceScreenState();
}

class _AccountBalanceScreenState extends State<AccountBalanceScreen> {
  @override
  void initState() {
    BlocProvider.of<GetGeneralDataCubit>(context).getGeneralData();
    BlocProvider.of<GetWeekAzkarRecordCubit>(context).getAllWeekAzkarRecord();
    BlocProvider.of<AzkarCubit>(context).getAllAzkar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding:  const EdgeInsets.only(
                top: ConstantValues.appTopPadding,
                left: ConstantValues.appHorizontalPadding,
                right: ConstantValues.appHorizontalPadding),
              child: CustomScrollView(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                slivers: [
                  const SliverToBoxAdapter(
                    child: TitleWithBackButton(
                      title: "رصيد الذكر",
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 34,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AutoSizeText(
                      "وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُمْ مَغْفِرَةً وَأَجْرًا عَظِيمًا",
                      textAlign: TextAlign.center,
                      style: cairoTextStyle(
                          15.sp, FontWeight.w800, null, appDarkTextColor),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 42,
                    ),
                  ),
                  const SliverToBoxAdapter(child: TotalBalanceNumber()),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 42,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: ScreenUtils.getScreenHeight(context)/6,
                      child: BlocBuilder<GetWeekAzkarRecordCubit,
                          GetWeekAzkarRecordState>(builder: ((context, state) {
                        if (state is GetWeekAzkarRecordLoaded) {
                          return LineChartForDayRecords(
                              records: state.allWeekRecord);
                        } else if (state is GetWeekAzkarRecordLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const SizedBox();
                        }
                      })),
                    ),
                  ),
                                 const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 42,
                    ),
                  ),
            
                  SliverToBoxAdapter(
                    // flex: 10,
                    child: BlocBuilder<GetWeekAzkarRecordCubit,
                        GetWeekAzkarRecordState>(
                      builder: (context, parentState) {
                        if (parentState is GetWeekAzkarRecordLoaded) {
                          return BlocBuilder<AzkarCubit, AzkarState>(
                            builder: (context, state) {
                              if (state is AzkarLoaded) {
                                return TabbarOfAzkarRecord(
                                  screenWidth: screenWidth,
                                  allWeekAzkarRecordsById:
                                      parentState.allWeekAzkarRecordsById,
                                  firstDayAzkarRecord:
                                      parentState.firstDayAzkarRecord,
                                  allAzkar: state.azkar,
                                );
                              } else if (state is AzkarError) {
                                return const Center(
                                  child: Text("Error"),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          );
                        } else if (parentState is GetWeekAzkarRecordError) {
                          return const Center(
                            child: Text("Error"),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
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
  final List<Zikr> allAzkar;
  final double screenWidth;

  @override
  State<TabbarOfAzkarRecord> createState() => _TabbarOfAzkarRecordState();
}

class _TabbarOfAzkarRecordState extends State<TabbarOfAzkarRecord> {
 List<Zikr> getSortedFilteredAzkar(Map<int, int> mapAzkarRecord) {
  // Filter out azkar with zero records or empty values
  List<Zikr> filteredAzkar = widget.allAzkar.where((zikr) {
    int? recordValue = mapAzkarRecord[zikr.id];
    return recordValue != null && recordValue != 0;
  }).toList();

  // Sort the remaining azkar based on the record values
  filteredAzkar.sort((a, b) {
    int valueA = mapAzkarRecord[a.id] ?? 0;
    int valueB = mapAzkarRecord[b.id] ?? 0;
    return valueB.compareTo(valueA);
  });

  return filteredAzkar;
}
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .cardColor, // Background color of the tab bar
                borderRadius: BorderRadius.circular(
                    42), // Rounded corners for the entire tab bar
              ),
              // padding: EdgeInsets.all(
              //     3), // Padding inside the container to space the tabs a bit
              child: TabBar(
                dividerColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
                indicator: BoxDecoration(
                  color: Theme.of(context)
                      .primaryColor, // Active tab background color
                  borderRadius: BorderRadius.circular(
                      42), // Rounded corners for the active tab
                ),
                labelColor: Colors.white, // Text color for the active tab
                labelStyle: Theme.of(context).textTheme.headlineSmall,
                unselectedLabelColor:
                    appDarkTextColor, // Text color for the inactive tabs
                unselectedLabelStyle: Theme.of(context).textTheme.headlineSmall,
                tabs: const [
                  SizedBox(
                    width: double.infinity,
                    child: Tab(
                      text: "يومي",
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Tab(
                      text: "اسبوعي",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getSortedFilteredAzkar(widget.allWeekAzkarRecordsById).length*81,
                child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                  SizedBox.expand(
                    child: Column(
                      children: getSortedFilteredAzkar(widget.firstDayAzkarRecord).map((azkar) {
                        int value = widget.firstDayAzkarRecord[azkar.id] ?? 0;

                        return Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          margin: const EdgeInsets.only(bottom: 20.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1,
                                color: appDarkTextColor),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                value != 0 ? value.toString() : "-",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors
                                      .black, // Replace with appDarkTextColor
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Text(
                                  azkar.content,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w800,
                                    color: Colors
                                        .black, // Replace with appDarkTextColor
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ), //list builder of azkar records of only the first day
                  SizedBox.expand(
                    child: Column(
                      children: getSortedFilteredAzkar(widget.allWeekAzkarRecordsById).map((azkar) {
                        int value = widget.allWeekAzkarRecordsById[azkar.id] ?? 0;

                        return Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 20.0),
                          margin: const EdgeInsets.only(bottom: 20.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1,
                                color: appDarkTextColor),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                value != 0 ? value.toString() : "-",
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800,
                                  color: Colors
                                      .black, // Replace with appDarkTextColor
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Text(
                                  azkar.content,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w800,
                                    color: Colors
                                        .black, // Replace with appDarkTextColor
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ), //list builder of azkar records of only the first day


                ]))
          ],
        ));
  }
}

class TotalBalanceNumber extends StatelessWidget {
  const TotalBalanceNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        // border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<GetGeneralDataCubit, GetGeneralDataState>(
            builder: (context, state) {
              if (state is GetGeneralDataLoaded) {
                return AutoSizeText(
                    ArabicNumbers()
                        .convert(state.generalData.accountBalance)
                        .toString(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Theme.of(context).primaryColor));
              } else if (state is GetGeneralDataError) {
                return AutoSizeText(
                  "Error",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: cairoTextStyle(
                      19.sp, FontWeight.w800, null, Colors.white),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Text(
            "رصيد الذكر",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
