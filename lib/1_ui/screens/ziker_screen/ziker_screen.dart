import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/back_button.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/set_azkar_records/set_azkar_records_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_current_zikr/get_current_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:bank_el_ziker/app_router.dart';
import 'package:bank_el_ziker/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:confetti/confetti.dart';
import '../../../consts/colors.dart';

class ZikerScreen extends StatefulWidget {
  const ZikerScreen({super.key});

  @override
  State<ZikerScreen> createState() => _ZikerScreenState();
}

class _ZikerScreenState extends State<ZikerScreen> {
  TextEditingController currentGoalController = TextEditingController();
  late int counter;
  late ConfettiController _controllerTopCenter;

  @override
  void initState() {
    BlocProvider.of<GetGeneralDataCubit>(context).getGeneralData();
    BlocProvider.of<AzkarCubit>(context).getAllAzkar();
    BlocProvider.of<GetCurrentZikrCubit>(context).getCurrentZikr();
    BlocProvider.of<SetAzkarRecordsCubit>(context)
        .incrementCertainZikrRecordOrJustFixRecords(null);
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 3));
    super.initState();
  }

  @override
  void dispose() {
    currentGoalController.dispose();
    _controllerTopCenter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: appWhite,
        appBar: AppBar(
          backgroundColor: appGreen,
          leading: const CustomBackButton(
            color: Colors.white,
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Stack(
                      children: [
                        Hero(
                            tag: "green_welcome_to_home_container",
                            child: Container(
                              decoration: BoxDecoration(
                                color: appGreen,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(45.w),
                                  bottomRight: Radius.circular(45.w),
                                ),
                              ),
                            )),
                        Container(
                          padding: EdgeInsets.only(
                              left: 31.w, right: 31.w, bottom: 10.h),
                          decoration: BoxDecoration(
                            color: appGreen,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(45.w),
                              bottomRight: Radius.circular(45.w),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, azkarScreenUrl);
                                      },
                                      style: ButtonStyle(
                                        overlayColor:
                                            MaterialStateColor.resolveWith(
                                                (states) => Colors.transparent),
                                      ),
                                      child: Hero(
                                        tag: "azkarScreenButton",
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w, vertical: 6.sp),
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(11))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 18.w),
                                                child: Text(
                                                  "اختر الذكر",
                                                  textAlign: TextAlign.center,
                                                  style: cairoTextStyle(
                                                      14.sp,
                                                      FontWeight.w800,
                                                      null,
                                                      appGreen),
                                                ),
                                              ),
                                              const Icon(
                                                Icons.menu_book,
                                                color: appGreen,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )),
                                  // TextButton(
                                  //     onPressed: () {
                                  //       BlocProvider.of<SetAzkarRecordsCubit>(
                                  //               context)
                                  //           .incrementCertainZikrRecordOrJustFixRecords(
                                  //               null);
                                  //       Navigator.pushNamed(
                                  //           context, accountBalanceUrl);
                                  //     },
                                  //     style: ButtonStyle(
                                  //       overlayColor:
                                  //           MaterialStateColor.resolveWith(
                                  //               (states) => Colors.transparent),
                                  //     ),
                                  //     child: Hero(
                                  //       tag: "balanceScreenButton",
                                  //       child: Container(
                                  //         padding: const EdgeInsets.all(1),
                                  //         decoration: const BoxDecoration(
                                  //             color: Colors.white,
                                  //             borderRadius: BorderRadius.all(
                                  //                 Radius.circular(11))),
                                  //         child: Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.center,
                                  //           children: [
                                  //             Container(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: 18.w),
                                  //               child: Text(
                                  //                 "رصيد البنك",
                                  //                 textAlign: TextAlign.center,
                                  //                 style: cairoTextStyle(
                                  //                     9.sp,
                                  //                     FontWeight.w800,
                                  //                     null,
                                  //                     appGreen),
                                  //               ),
                                  //             ),
                                  //             Container(
                                  //               padding: EdgeInsets.symmetric(
                                  //                   horizontal: 16.w,
                                  //                   vertical: 6.sp),
                                  //               decoration: BoxDecoration(
                                  //                   borderRadius:
                                  //                       BorderRadius.circular(
                                  //                           11),
                                  //                   color: appGreen),
                                  //               child: Image.asset(
                                  //                 "assets/images/bank_icon.png",
                                  //                 color: Colors.white,
                                  //               ),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     )),
                                ],
                              ),
                              Expanded(child: BlocBuilder<GetCurrentZikrCubit,
                                  GetCurrentZikrState>(
                                builder: (context, parentState) {
                                  if (parentState is GetCurrentZikrLoaded) {
                                    return BlocBuilder<AzkarCubit, AzkarState>(
                                      builder: (context, state) {
                                        if (state is AzkarLoaded) {
                                          return Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: AutoSizeText(
                                                state.azkar
                                                    .firstWhere((zikr) =>
                                                        zikr.id ==
                                                        parentState.zikrId)
                                                    .content,
                                                textAlign: TextAlign.center,
                                                style: cairoTextStyle(
                                                    47.sp,
                                                    FontWeight.w700,
                                                    1.4,
                                                    Colors.white),
                                              ),
                                            ),
                                          );
                                        } else if (state is AzkarError) {
                                          //check
                                          return AutoSizeText(
                                            ".يوجد خطأ. يرجي إعادة فتح التطبيق",
                                            textAlign: TextAlign.center,
                                            style: cairoTextStyle(
                                                20.sp,
                                                FontWeight.w700,
                                                null,
                                                Colors.white),
                                          );
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      },
                                    );
                                  } else if (parentState
                                      is GetCurrentZikrError) {
                                    //check
                                    return AutoSizeText(
                                      ".يوجد خطأ. يرجي إعادة فتح التطبيق",
                                      textAlign: TextAlign.center,
                                      style: cairoTextStyle(20.sp,
                                          FontWeight.w700, null, Colors.white),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 31.w, vertical: 19.h),
                    child: AutoSizeText.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "جدد نيتك :",
                            style: cairoTextStyle(
                                1.sp, FontWeight.w800, null, appGreen),
                          ),
                          TextSpan(
                            text:
                                " وَالذَّاكِرِينَ اللَّهَ كَثِيرًا وَالذَّاكِرَاتِ أَعَدَّ اللَّهُ لَهُم مَّغْفِرَةً وَأَجْرًا عَظِيمًا - الأحزاب 35",
                            style: cairoTextStyle(
                                15.sp, FontWeight.w400, null, appDarkTextColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 31.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  showGoalSettingSheet(context, screenHeight,
                                      currentGoalController, () {
                                    setState(() {
                                      counter = 0;
                                    });
                                    BlocProvider.of<UpdateGeneralDataCubit>(
                                            context)
                                        .updateCounter(0);
                                    // HiveDB().printDB();
                                  });
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: appGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        61.0), // Set your desired border radius here
                                  ),
                                ),
                                child: Text(
                                  "تعيين الهدف",
                                  style: cairoTextStyle(14.sp, FontWeight.w600,
                                      null, Colors.white),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    counter = 0;
                                    currentGoalController.text = "";
                                  });
                                  BlocProvider.of<UpdateGeneralDataCubit>(
                                          context)
                                      .updateCounter(counter);
                                  BlocProvider.of<UpdateGeneralDataCubit>(
                                          context)
                                      .updateGeneralDataGoal(null);
                                  // HiveDB().printDB();
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: appGreen,
                                    shape: const CircleBorder()),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "إعادة",
                                        style: cairoTextStyle(
                                            10.sp,
                                            FontWeight.w700,
                                            1.18,
                                            Colors.white),
                                      ),
                                      Text(
                                        "ضبط",
                                        style: cairoTextStyle(
                                            10.sp,
                                            FontWeight.w700,
                                            1.18,
                                            Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: BlocConsumer<GetGeneralDataCubit,
                              GetGeneralDataState>(
                            listener: (context, state) {
                              if (state is GetGeneralDataLoaded) {
                                counter = state.generalData.currentCounter;
                                if (state.generalData.currentGoal != null) {
                                  currentGoalController.text =
                                      state.generalData.currentGoal.toString();
                                }
                              }
                            },
                            builder: (context, state) {
                              if (state is GetGeneralDataLoaded) {
                                return TextButton(
                                  onPressed: () {
                                    setState(() {
                                      counter++;
                                    });
                                    BlocProvider.of<UpdateGeneralDataCubit>(
                                            context)
                                        .incrementAccountBalance();
                                    BlocProvider.of<UpdateGeneralDataCubit>(
                                            context)
                                        .updateCounter(counter);
                                    BlocProvider.of<SetAzkarRecordsCubit>(
                                            context)
                                        .incrementCertainZikrRecordOrJustFixRecords(
                                            state.generalData.currentZikrId);
                                    if (currentGoalController.text.isNotEmpty &&
                                        counter ==
                                            int.parse(
                                                currentGoalController.text)) {
                                      _controllerTopCenter.play();
                                    }
                                    if (currentGoalController.text.isNotEmpty &&
                                        counter >
                                            int.parse(
                                                currentGoalController.text)) {
                                      setState(() {
                                        counter = 1;
                                        currentGoalController.text = "";
                                      });
                                      BlocProvider.of<UpdateGeneralDataCubit>(
                                              context)
                                          .updateCounter(counter);
                                      BlocProvider.of<UpdateGeneralDataCubit>(
                                              context)
                                          .updateGeneralDataGoal(null);
                                    }
                                    // HiveDB().printDB();
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(
                                          232, 255, 238, 1),
                                      shape: const CircleBorder(
                                          side: BorderSide(
                                              color: appGreen, width: 7))),
                                  child: Container(
                                    width: screenWidth * .6,
                                    padding: EdgeInsets.all(10.h),
                                    child: Center(
                                      child: Container(
                                        padding: EdgeInsets.all(10.h),
                                        child:
                                            currentGoalController.text.isEmpty
                                                ? AutoSizeText(
                                                    counter.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: cairoTextStyle(
                                                        50.sp,
                                                        FontWeight.w700,
                                                        null,
                                                        appGreen),
                                                    maxLines: 1,
                                                  )
                                                : AutoSizeText.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "$counter",
                                                          style: cairoTextStyle(
                                                              50.sp,
                                                              FontWeight.w700,
                                                              .85,
                                                              appGreen),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "\n━\n${currentGoalController.text}",
                                                          style: cairoTextStyle(
                                                              25.sp,
                                                              FontWeight.w700,
                                                              .85,
                                                              goalYellow),
                                                        ),
                                                      ],
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    maxLines: 3,
                                                  ),
                                      ),
                                    ),
                                  ),
                                );
                              } else if (state is GetGeneralDataError) {
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
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerTopCenter,
                blastDirection: pi / 2, // Set the blast direction
                particleDrag: 0.05, // apply drag to the confetti
                emissionFrequency: 0.05, // how often it should emit
                numberOfParticles: 20, // number of particles to emit
                gravity: 0.1, // gravity - or fall speed
                shouldLoop: false, maximumSize: const Size(15, 15),
                minimumSize: const Size(10, 10),
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.red,
                  Colors.yellow,
                  Colors.purple,
                  Colors.orange,
                ],
                strokeWidth: 0,
              ),
            ),
          ],
        ));
  }

  Future<dynamic> showGoalSettingSheet(
      BuildContext parentContext,
      double screenHeight,
      TextEditingController textEditingController,
      Function() onGoalUpdate) {
    bool isSaved = false;
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
      ),
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30.w, right: 30.w, left: 30.w),
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
                //   color: Colors.red,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.w),
                    child: Center(
                      child: Text('حدد هدفك',
                          style: cairoTextStyle(
                              18.sp, FontWeight.w700, null, appDarkTextColor)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: inputDecoration,
                      textAlign: TextAlign.center,
                      cursorColor: appGreen,
                      style: cairoTextStyle(
                          28.sp, FontWeight.w500, null, appDarkTextColor),
                      maxLength: 7,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        NoLeadingZeroInputFormatter(),
                        WhitespaceInputFormatter()
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          BlocProvider.of<UpdateGeneralDataCubit>(parentContext)
                              .updateGeneralDataGoal(int.parse(
                                  currentGoalController.text.toString()));
                          onGoalUpdate();
                          isSaved = true;
                          // HiveDB().printDB();

                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          side: const BorderSide(width: 1, color: Colors.green),
                        ),
                        child: Text(
                          'حفظ',
                          style: cairoTextStyle(
                              13.sp, FontWeight.w700, null, appGreen),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          side: const BorderSide(width: 1, color: Colors.red),
                        ),
                        child: Text('إلغاء',
                            style: cairoTextStyle(
                                13.sp, FontWeight.w700, null, Colors.red)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).whenComplete(() => !isSaved ? textEditingController.text = "" : 0);
  }
}

var inputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 8, color: Colors.green),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 2, color: appGreen),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 2, color: appGreen),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 2, color: appGreen),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 2, color: appGreen),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 2, color: appGreen),
    ));

class NoLeadingZeroInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty && newValue.text.startsWith('0')) {
      return oldValue;
    }
    return newValue;
  }
}

class WhitespaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty && newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}
