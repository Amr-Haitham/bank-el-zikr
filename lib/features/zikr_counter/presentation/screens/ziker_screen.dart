import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/fix_and_increment_record.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/fix_and_increment_record_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/get_settings_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:confetti/confetti.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:flutter/services.dart';

import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/tasbih_stats_card.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/tasbih_progress_circle.dart';
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
        HapticFeedback.vibrate();
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
                                "Digital Tasbih",
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
                                onEditGoal: () =>
                                    _showGoalSettingSheet(context),
                              ),
                              const SizedBox(height: 44),
                              SizedBox(
                                height: 88,
                                child: _buildZikrRow(
                                    context, counter.currentZikrId),
                              ),
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
                              _buildResetButton(context),
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

  Widget _buildZikrRow(BuildContext context, int currentZikrId) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child:
                BlocBuilder<GetAllAzkarCubit, RequestState<List<ZikrEntity>>>(
              builder: (context, azkarState) {
                return azkarState.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                  failure: (f) => const SizedBox.shrink(),
                  success: (azkar) {
                    if (azkar.isEmpty) return const SizedBox.shrink();
                    final currentZikr = azkar.firstWhere(
                      (z) => z.id == currentZikrId,
                      orElse: () => azkar.first,
                    );
                    return AutoSizeText(
                      currentZikr.content,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      minFontSize: 18,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 34),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => AutoTabsRouter.of(context).setActiveIndex(2),
            child: Icon(Icons.swap_horiz_rounded,
                color: Theme.of(context).primaryColor, size: 34),
          ),
        ],
      ),
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return Center(
      child: OutlinedButton.icon(
        onPressed: () {
          context.read<CounterCubit>().setCounter(0);
          context.read<CounterCubit>().setGoal(null);
          setState(() => _laps = 0);
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          side: BorderSide(color: Theme.of(context).primaryColor),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: const Icon(Icons.refresh, size: 18),
        label:
            const Text("Reset", style: TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
