import 'dart:math';

import 'package:bank_el_ziker/features/azkar_records/domain/usecases/fix_and_increment_record.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/fix_and_increment_record_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/daily_activity_log_cubit.dart';
import 'package:bank_el_ziker/core/utils/haptics.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confetti/confetti.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';

import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/tasbih_stats_card.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/tasbih_progress_circle.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/tasbih_zikr_switcher_row.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/tasbih_reset_button.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/goal_setting_bottom_sheet.dart';

class ZikerScreen extends StatefulWidget {
  const ZikerScreen({super.key});

  @override
  State<ZikerScreen> createState() => _ZikerScreenState();
}

class _ZikerScreenState extends State<ZikerScreen> {
  final TextEditingController currentGoalController = TextEditingController();
  late ConfettiController _controllerTopCenter;
  int _laps = 0;

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
      setState(() => _laps++);
      if (isVibrating) {
        vibrateCelebration();
      }
    }

    if (counterState.currentGoal != null &&
        newCounter > counterState.currentGoal!) {
      context.read<CounterCubit>().setCounter(1);
    } else {
      context.read<CounterCubit>().setCounter(newCounter);
    }

    context.read<CounterCubit>().addToBalance();

    context.read<FixAndIncrementRecordCubit>().executeFixAndIncrement(
        FixAndIncrementRecordParams(zikrId: counterState.currentZikrId));
    context
        .read<DailyActivityLogCubit>()
        .logZikrIncrement(counterState.currentZikrId);
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
    return BlocBuilder<SettingsCubit, RequestState<Settings>>(
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
                        failure: (f) => Center(
                            child: Text(AppLocalizations.of(context)
                                .errorLoadingCounter)),
                        success: (counter) {
                          final goalText =
                              counter.currentGoal?.toString() ?? "";
                          if (currentGoalController.text != goalText) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              currentGoalController.text = goalText;
                            });
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                AppLocalizations.of(context).digitalTasbih,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(fontSize: 22),
                              ),
                              const SizedBox(height: 20),
                              TasbihStatsCard(
                                balance: counter.accountBalance,
                                laps: _laps,
                                goal: counter.currentGoal,
                                currentCounter: counter.currentCounter,
                                onEditGoal: () =>
                                    _showGoalSettingSheet(context),
                              ),
                              const SizedBox(height: 44),
                              TasbihZikrSwitcherRow(
                                  currentZikrId: counter.currentZikrId),
                              const SizedBox(height: 20),
                              Expanded(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () =>
                                      _handleIncrement(counter, isVibrating),
                                  child: TasbihProgressCircle(
                                    currentCounter: counter.currentCounter,
                                    goal: counter.currentGoal,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TasbihResetButton(
                                onPressed: () {
                                  context.read<CounterCubit>().setCounter(0);
                                  context.read<CounterCubit>().setGoal(null);
                                  setState(() => _laps = 0);
                                },
                              ),
                              const SizedBox(
                                  height: ConstantValues.appBottomPadding),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: IgnorePointer(
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
