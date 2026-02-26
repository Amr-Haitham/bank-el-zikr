import 'dart:math';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/custom_app_button.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/custom_app_text_field.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/fix_and_increment_record.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/fix_and_increment_record_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/get_settings_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confetti/confetti.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:vibration/vibration.dart';
import 'package:auto_route/auto_route.dart';

import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';

class ZikerScreen extends StatefulWidget {
  const ZikerScreen({super.key});

  @override
  State<ZikerScreen> createState() => _ZikerScreenState();
}

class _ZikerScreenState extends State<ZikerScreen> {
  final TextEditingController currentGoalController = TextEditingController();
  late ConfettiController _controllerTopCenter;

  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 3));

    // Ensure records are fixed on entry
    context
        .read<FixAndIncrementRecordCubit>()
        .executeFixAndIncrement(FixAndIncrementRecordParams(zikrId: null));
  }

  @override
  void dispose() {
    currentGoalController.dispose();
    _controllerTopCenter.dispose();
    super.dispose();
  }

  void _handleIncrement(CounterStateEntity counterState, bool isVibrating) {
    final newCounter = counterState.currentCounter + 1;

    // Check goal
    if (counterState.currentGoal != null &&
        newCounter == counterState.currentGoal) {
      _controllerTopCenter.play();
      if (isVibrating) {
        Vibration.hasVibrator().then((value) {
          if (value == true) {
            Vibration.vibrate(duration: 1000);
          }
        });
      }
    }

    // Auto-reset if exceeded goal
    if (counterState.currentGoal != null &&
        newCounter > counterState.currentGoal!) {
      context.read<CounterCubit>().setCounter(1);
      context.read<CounterCubit>().setGoal(null);
    } else {
      context.read<CounterCubit>().setCounter(newCounter);
    }

    // Increment global balance
    context.read<CounterCubit>().addToBalance();

    // Increment daily record
    context.read<FixAndIncrementRecordCubit>().executeFixAndIncrement(
        FixAndIncrementRecordParams(zikrId: counterState.currentZikrId));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<GetSettingsCubit, RequestState<Settings>>(
      builder: (context, settingsState) {
        final isVibrating =
            settingsState.whenOrNull(success: (s) => s.isVibrating) ?? true;

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: ConstantValues.appTopPadding,
                  left: ConstantValues.appHorizontalPadding,
                  right: ConstantValues.appHorizontalPadding),
              child: Stack(
                children: [
                  BlocBuilder<CounterCubit, RequestState<CounterStateEntity>>(
                    builder: (context, counterState) {
                      return counterState.when(
                        initial: () =>
                            const Center(child: CircularProgressIndicator()),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        failure: (f) =>
                            const Center(child: Text("Error loading counter")),
                        success: (counter) {
                          if (counter.currentGoal != null) {
                            currentGoalController.text =
                                counter.currentGoal.toString();
                          } else {
                            currentGoalController.text = "";
                          }

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TitleWithBackButton(
                                title: "ورد التسبيح",
                                trailing: TextButton(
                                  onPressed: () {
                                    context.router.push(const AzkarRoute());
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(61.0),
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
                                              color: GeneralUtils.isLightTheme(
                                                      context)
                                                  ? appWhite
                                                  : appDark,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                height:
                                    ScreenUtils.getScreenHeight(context) / 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(24)),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: BlocBuilder<GetAllAzkarCubit,
                                          RequestState<List<ZikrEntity>>>(
                                        builder: (context, azkarState) {
                                          return azkarState.when(
                                            initial: () =>
                                                const CircularProgressIndicator(),
                                            loading: () =>
                                                const CircularProgressIndicator(),
                                            failure: (f) => const Text(
                                                "Error loading azkar"),
                                            success: (azkar) {
                                              final currentZikr =
                                                  azkar.firstWhere(
                                                (z) =>
                                                    z.id ==
                                                    counter.currentZikrId,
                                                orElse: () => azkar.first,
                                              );
                                              return AutoSizeText(
                                                currentZikr.content,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      showGoalSettingSheet(context, counter);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(61.0),
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
                                                    GeneralUtils.isLightTheme(
                                                            context)
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
                                  counter.currentGoal != null
                                      ? ArabicNumbers()
                                          .convert(counter.currentGoal!)
                                      : "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                          color: const Color.fromRGBO(
                                              255, 184, 0, 1)),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            context
                                                .read<CounterCubit>()
                                                .setCounter(0);
                                            context
                                                .read<CounterCubit>()
                                                .setGoal(null);
                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor: Theme.of(context)
                                                  .primaryColor,
                                              shape: const CircleBorder()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.replay_rounded,
                                              color: GeneralUtils.isLightTheme(
                                                      context)
                                                  ? appWhite
                                                  : appDark,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15)
                                      ],
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => _handleIncrement(
                                            counter, isVibrating),
                                        child: Container(
                                          color: Colors.transparent,
                                          width: double.infinity,
                                          child: Center(
                                            child: Container(
                                              width: screenWidth * .6,
                                              height: screenWidth * .6,
                                              decoration: BoxDecoration(
                                                color:
                                                    Theme.of(context).cardColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: AutoSizeText(
                                                  counter.currentCounter != 0
                                                      ? ArabicNumbers().convert(
                                                          counter
                                                              .currentCounter)
                                                      : "إضغط للبدء",
                                                  textAlign: TextAlign.center,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                          fontSize:
                                                              counter.currentCounter !=
                                                                      0
                                                                  ? 70
                                                                  : 24,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        height:
                                            ConstantValues.appBottomPadding),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ConfettiWidget(
                      confettiController: _controllerTopCenter,
                      blastDirection: pi / 2,
                      particleDrag: 0.05,
                      emissionFrequency: 0.05,
                      numberOfParticles: 20,
                      gravity: 0.1,
                      shouldLoop: false,
                      maximumSize: const Size(15, 15),
                      minimumSize: const Size(10, 10),
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.red,
                        Colors.yellow,
                        Colors.purple,
                        Colors.orange,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showGoalSettingSheet(
      BuildContext parentContext, CounterStateEntity state) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: ConstantValues.appTopPadding,
              right: ConstantValues.appHorizontalPadding,
              left: ConstantValues.appHorizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 73,
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
                const SizedBox(height: 35),
                Center(
                  child: Text('سيهتز الهاتف عند بلوغ الهدف',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                const SizedBox(height: 35),
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
                const SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: CustomAppButton(
                          onPressed: () {
                            final goal =
                                int.tryParse(currentGoalController.text);
                            if (goal != null) {
                              parentContext
                                  .read<CounterCubit>()
                                  .setGoal(goal);
                              parentContext
                                  .read<CounterCubit>()
                                  .setCounter(0);
                              Navigator.pop(context);
                            }
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
    );
  }
}

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
