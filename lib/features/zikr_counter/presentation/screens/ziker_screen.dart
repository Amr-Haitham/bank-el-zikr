import 'dart:math';

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/fix_and_increment_record.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/fix_and_increment_record_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/get_settings_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confetti/confetti.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:vibration/vibration.dart';
import 'package:auto_route/auto_route.dart';

import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/zikr_display_card.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/counter_circle.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/goal_setting_bottom_sheet.dart';

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

    if (counterState.currentGoal != null &&
        newCounter > counterState.currentGoal!) {
      context.read<CounterCubit>().setCounter(1);
      context.read<CounterCubit>().setGoal(null);
    } else {
      context.read<CounterCubit>().setCounter(newCounter);
    }

    context.read<CounterCubit>().addToBalance();

    context.read<FixAndIncrementRecordCubit>().executeFixAndIncrement(
        FixAndIncrementRecordParams(zikrId: counterState.currentZikrId));
  }

  void _showGoalSettingSheet(BuildContext parentContext) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder: (context) {
        return GoalSettingBottomSheet(
          goalController: currentGoalController,
          parentContext: parentContext,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                              _buildHeader(context),
                              const SizedBox(height: 30),
                              ZikrDisplayCard(
                                  currentZikrId: counter.currentZikrId),
                              const SizedBox(height: 16),
                              _buildGoalButton(context),
                              _buildGoalDisplay(context, counter),
                              Expanded(
                                flex: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    _buildResetButton(context),
                                    Expanded(
                                      child: CounterCircle(
                                        currentCounter: counter.currentCounter,
                                        onTap: () => _handleIncrement(
                                            counter, isVibrating),
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

  Widget _buildHeader(BuildContext context) {
    return TitleWithBackButton(
      title: "ورد التسبيح",
      trailing: TextButton(
        onPressed: () {
          context.router.push(const AzkarRoute());
        },
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(61.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            "تغيير الذكر",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: GeneralUtils.isLightTheme(context) ? appWhite : appDark,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => _showGoalSettingSheet(context),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(61.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "تعيين الهدف",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color:
                      GeneralUtils.isLightTheme(context) ? appWhite : appDark,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGoalDisplay(BuildContext context, CounterStateEntity counter) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Text(
        counter.currentGoal != null
            ? ArabicNumbers().convert(counter.currentGoal!)
            : "",
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: appGold),
      ),
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.read<CounterCubit>().setCounter(0);
            context.read<CounterCubit>().setGoal(null);
          },
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: const CircleBorder()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.replay_rounded,
              color: GeneralUtils.isLightTheme(context) ? appWhite : appDark,
            ),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
