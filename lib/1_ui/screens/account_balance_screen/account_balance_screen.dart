import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/get_week_azkar_record/get_week_azkar_record_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
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
          body: Stack(
            children: [
              Hero(
                  tag: "balanceScreenButton",
                  child: Container(
                    color: Colors.white,
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: 30.w, right: 30.w, left: 30.w, bottom: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleWithBackButton(
                      title: "رصيد الذكر",
                    ),
                    const SizedBox(height: 34,),
                    AutoSizeText(
                      "وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُمْ مَغْفِرَةً وَأَجْرًا عَظِيمًا",
                      textAlign: TextAlign.center,
                      style: cairoTextStyle(
                          15.sp, FontWeight.w800, null, appDarkTextColor),
                    ),                    const SizedBox(height: 32,),

                    const TotalBalanceNumber(),                    const SizedBox(height: 32,),

                    Expanded(
                      flex: 4,
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
                    SizedBox(
                      height: 23.h,
                    ),
                    Expanded(
                      flex: 10,
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
            ],
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              child: TabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 0),
                indicator: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(13),
                ),
                labelColor: Colors.white,
                labelStyle: cairoTextStyle(15.sp, FontWeight.w800, null,
                    Theme.of(context).primaryColor),
                unselectedLabelColor: appDarkTextColor,
                unselectedLabelStyle: cairoTextStyle(15.sp, FontWeight.w800,
                    null, Theme.of(context).primaryColor),
                tabs: [
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: const Tab(
                        text: "يومي",
                      )),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Tab(
                      text: "اسبوعي",
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                  //list buidler of azkar records of only the first day
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.allAzkar.length,
                    itemBuilder: ((context, index) {
                      //weird sort functions to sort from highest to lowest score
                      widget.allAzkar.sort((a, b) {
                        int valueA = widget.firstDayAzkarRecord.entries
                            .firstWhere((e) => e.key == a.id,
                                orElse: () => const MapEntry(0, 0))
                            .value;

                        int valueB = widget.firstDayAzkarRecord.entries
                            .firstWhere((e) => e.key == b.id,
                                orElse: () => const MapEntry(0, 0))
                            .value;

                        return valueB.compareTo(valueA);
                      });
                      int value =
                          widget.firstDayAzkarRecord.entries.firstWhere((e) {
                        return e.key == widget.allAzkar[index].id;
                      }, orElse: () => const MapEntry(0, 0)).value;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 20.h),
                          margin: EdgeInsets.only(bottom: 20.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                value != 0 ? value.toString() : "-",
                                maxLines: 1,
                                style: cairoTextStyle(14.sp, FontWeight.w800,
                                    null, appDarkTextColor),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  widget.allAzkar[index].content,
                                  textAlign: TextAlign.right,
                                  //  maxLines: 1,
                                  style: cairoTextStyle(14.sp, FontWeight.w800,
                                      null, appDarkTextColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  //list builder of azkar records of only the first day

                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.allAzkar.length,
                    itemBuilder: ((context, index) {
                      widget.allAzkar.sort((a, b) {
                        int valueA = widget.allWeekAzkarRecordsById.entries
                            .firstWhere((e) => e.key == a.id,
                                orElse: () => const MapEntry(0, 0))
                            .value;

                        int valueB = widget.allWeekAzkarRecordsById.entries
                            .firstWhere((e) => e.key == b.id,
                                orElse: () => const MapEntry(0, 0))
                            .value;

                        return valueB.compareTo(valueA);
                      });
                      int value = widget.allWeekAzkarRecordsById.entries
                          .firstWhere((e) {
                        return e.key == widget.allAzkar[index].id;
                      }, orElse: () => const MapEntry(0, 0)).value;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 20.h),
                          margin: EdgeInsets.only(bottom: 20.h),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                value != 0 ? value.toString() : "-",
                                maxLines: 1,
                                style: cairoTextStyle(14.sp, FontWeight.w800,
                                    null, appDarkTextColor),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Expanded(
                                child: AutoSizeText(
                                  widget.allAzkar[index].content,
                                  textAlign: TextAlign.right,
                                  //  maxLines: 1,
                                  style: cairoTextStyle(14.sp, FontWeight.w800,
                                      null, appDarkTextColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
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
      padding: const EdgeInsets.symmetric(vertical: 22,horizontal: 16),
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
                  ArabicNumbers().convert(state.generalData.accountBalance).toString(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).primaryColor)
                );
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
