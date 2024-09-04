import 'dart:math';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/custom_app_button.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/custom_app_text_field.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/azkar_records/set_azkar_records/set_azkar_records_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_current_zikr/get_current_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:bank_el_ziker/2_state_management/settings/get_settings_cubit/get_settings_cubit.dart';
import 'package:bank_el_ziker/4_utility_functions/general_utils.dart';
import 'package:bank_el_ziker/4_utility_functions/screen_utils.dart';
import 'package:bank_el_ziker/app_router.dart';
import 'package:bank_el_ziker/1_ui/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confetti/confetti.dart';
import '../../core/consts/constant_values.dart';
import 'package:vibration/vibration.dart';

class ZikerScreen extends StatefulWidget {
  const ZikerScreen({super.key});

  @override
  State<ZikerScreen> createState() => _ZikerScreenState();
}

class _ZikerScreenState extends State<ZikerScreen> {
  TextEditingController currentGoalController = TextEditingController();
  late int counter;
  late ConfettiController _controllerTopCenter;
  bool isVibrating = true;
  @override
  void initState() {
    BlocProvider.of<GetGeneralDataCubit>(context).getGeneralData();
    BlocProvider.of<AzkarCubit>(context).getAllAzkar();
    BlocProvider.of<GetCurrentZikrCubit>(context).getCurrentZikr();
    BlocProvider.of<SetAzkarRecordsCubit>(context)
        .incrementCertainZikrRecordOrJustFixRecords(null);
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 3));
    BlocProvider.of<GetSettingsCubit>(context).getSettings();
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
    return BlocListener<GetSettingsCubit, GetSettingsState>(
      listener: (context, state) {
        if (state is GetSettingsLoaded) {
          setState(() {
            isVibrating = state.isVibrating;
          });
        }
      },
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: ConstantValues.appTopPadding,
                  left: ConstantValues.appHorizontalPadding,
                  right: ConstantValues.appHorizontalPadding),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleWithBackButton(
                        title: "ورد التسبيح",
                        trailing: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, azkarScreenUrl);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  61.0), // Set your desired border radius here
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              "تغيير الذكر",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: GeneralUtils.isLightTheme(context)
                                          ? appWhite
                                          : appDark,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: ScreenUtils.getScreenHeight(context) / 5,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(24),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: BlocBuilder<
                                      GetCurrentZikrCubit, GetCurrentZikrState>(
                                    builder: (context, parentState) {
                                      if (parentState is GetCurrentZikrLoaded) {
                                        return BlocBuilder<AzkarCubit,
                                            AzkarState>(
                                          builder: (context, state) {
                                            if (state is AzkarLoaded) {
                                              return Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: AutoSizeText(
                                                    state.azkar
                                                        .firstWhere((zikr) =>
                                                            zikr.id ==
                                                            parentState.zikrId)
                                                        .content,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium,
                                                  ),
                                                ),
                                              );
                                            } else if (state is AzkarError) {
                                              //check
                                              return AutoSizeText(
                                                ".يوجد خطأ. يرجي إعادة فتح التطبيق",
                                                textAlign: TextAlign.center,
                                                style: cairoTextStyle(
                                                    20,
                                                    FontWeight.w700,
                                                    null,
                                                    Colors.white),
                                              );
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
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
                                          style: cairoTextStyle(
                                              20,
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
                                  ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              showGoalSettingSheet(
                                  context, screenHeight, currentGoalController,
                                  () {
                                setState(() {
                                  counter = 0;
                                });
                                BlocProvider.of<UpdateGeneralDataCubit>(context)
                                    .updateCounter(0);
                                // HiveDB().printDB();
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    61.0), // Set your desired border radius here
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Text(
                                "تعيين الهدف",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color:
                                            GeneralUtils.isLightTheme(context)
                                                ? appWhite
                                                : appDark,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Text(
                          ArabicNumbers().convert(currentGoalController.text),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: const Color.fromRGBO(255, 184, 0, 1)),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      shape: const CircleBorder()),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.replay_rounded,
                                      color: GeneralUtils.isLightTheme(context)
                                          ? appWhite
                                          : appDark,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                            Expanded(
                              child: BlocConsumer<GetGeneralDataCubit,
                                  GetGeneralDataState>(
                                listener: (context, state) {
                                  if (state is GetGeneralDataLoaded) {
                                    counter = state.generalData.currentCounter;
                                    if (state.generalData.currentGoal != null) {
                                      currentGoalController.text = state
                                          .generalData.currentGoal
                                          .toString();
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
                                                state
                                                    .generalData.currentZikrId);
                                        if (currentGoalController
                                                .text.isNotEmpty &&
                                            counter ==
                                                int.parse(currentGoalController
                                                    .text)) {
                                          _controllerTopCenter.play();
                                          if (isVibrating) {
                                            Vibration.hasVibrator()
                                                .then((value) {
                                              if (value == true) {
                                                Vibration.vibrate(
                                                    duration: 1000);
                                              }
                                            });
                                          }
                                          // Vibration.hasVibrator().then((value) {
                                          //   if (value == true) {
                                          //     Vibration.vibrate(duration: 1000);
                                          //   }
                                          // });
                                        }
                                        if (currentGoalController
                                                .text.isNotEmpty &&
                                            counter >
                                                int.parse(currentGoalController
                                                    .text)) {
                                          setState(() {
                                            counter = 1;
                                            currentGoalController.text = "";
                                          });
                                          BlocProvider.of<
                                                      UpdateGeneralDataCubit>(
                                                  context)
                                              .updateCounter(counter);
                                          BlocProvider.of<
                                                      UpdateGeneralDataCubit>(
                                                  context)
                                              .updateGeneralDataGoal(null);
                                        }
                                        // HiveDB().printDB();
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              Theme.of(context).cardColor,
                                          shape: const CircleBorder()),
                                      child: Container(
                                        width: screenWidth * .6,
                                        // padding: EdgeInsets.all(10.h),
                                        child: Center(
                                          child: Container(
                                            // padding: EdgeInsets.all(10.h),
                                            child: AutoSizeText(
                                              counter != 0
                                                  ? ArabicNumbers()
                                                      .convert(counter)
                                                      .toString()
                                                  : "إضغط للبدء",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: counter != 0
                                                          ? 70
                                                          : 24,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                              maxLines: 1,
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
                            ),
                            const SizedBox(
                                height: ConstantValues.appBottomPadding),
                          ],
                        ),
                      ),
                    ],
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
              ),
            ),
          )),
    );
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
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return Container(
          // height: ScreenUtils.getScreenHeight(context)*.75,

          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: ConstantValues.appTopPadding,
              right: ConstantValues.appHorizontalPadding,
              left: ConstantValues.appHorizontalPadding),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            //   color: Colors.red,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 73,
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Text('سيهتز الهاتف عند بلوغ الهدف',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                const SizedBox(
                  height: 35,
                ),
                CustomAppTextField(
                  title: "إضافة الهدف",
                  keyboardType: TextInputType.number,
                  controller: currentGoalController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    NoLeadingZeroInputFormatter(),
                    WhitespaceInputFormatter()
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomAppButton(
                          onPressed: () {
                            BlocProvider.of<UpdateGeneralDataCubit>(
                                    parentContext)
                                .updateGeneralDataGoal(int.parse(
                                    currentGoalController.text.toString()));
                            onGoalUpdate();
                            isSaved = true;
                            // HiveDB().printDB();

                            Navigator.pop(context);
                          },
                          text: "حفظ"),
                    ),
                  ],
                ),
                const SizedBox(height: ConstantValues.appBottomPadding),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() => !isSaved ? textEditingController.text = "" : 0);
  }
}

inputDecoration(context) => InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(width: 8, color: Colors.green),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
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
