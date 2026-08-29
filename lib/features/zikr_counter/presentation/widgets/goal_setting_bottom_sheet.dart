import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/input_formatters.dart';

class GoalSettingBottomSheet extends StatefulWidget {
  final TextEditingController goalController;
  final BuildContext parentContext;

  const GoalSettingBottomSheet({
    super.key,
    required this.goalController,
    required this.parentContext,
  });

  @override
  State<GoalSettingBottomSheet> createState() => _GoalSettingBottomSheetState();
}

class _GoalSettingBottomSheetState extends State<GoalSettingBottomSheet> {
  static const _presets = [33, 99, 100, 1000];

  void _selectPreset(int preset) {
    setState(() {
      widget.goalController.text = preset.toString();
    });
  }

  void _save() {
    final goal = int.tryParse(widget.goalController.text);
    if (goal != null) {
      widget.parentContext.read<CounterCubit>().setGoal(goal);
      widget.parentContext.read<CounterCubit>().setCounter(0);
      Navigator.pop(context);
    }
  }

  void _removeGoal() {
    widget.parentContext.read<CounterCubit>().setGoal(null);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).viewInsets.bottom + ConstantValues.spacingXl,
        top: ConstantValues.spacingMd,
        right: ConstantValues.appHorizontalPadding,
        left: ConstantValues.appHorizontalPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color:
                    context.textTheme.bodyLarge!.color!.withValues(alpha: 0.2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context).setGoal,
              style: context.textTheme.bodyMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context).vibrateAtLap,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color:
                    context.textTheme.bodySmall!.color!.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  vertical: ConstantValues.spacingLg),
              decoration: BoxDecoration(
                color: context.theme.cardColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextField(
                controller: widget.goalController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  NoLeadingZeroInputFormatter(),
                  WhitespaceInputFormatter(),
                ],
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: _presets
                  .map((preset) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: ConstantValues.spacingXs),
                          child: GestureDetector(
                            onTap: () => _selectPreset(preset),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: ConstantValues.spacingMd),
                              decoration: BoxDecoration(
                                color: context.theme.cardColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  preset.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: context.theme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      vertical: ConstantValues.spacingMd),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context).saveLabel,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 14),
            GestureDetector(
              onTap: _removeGoal,
              child: Text(
                AppLocalizations.of(context).removeGoal,
                style: TextStyle(
                  fontSize: 13,
                  color: context.textTheme.bodySmall!.color!
                      .withValues(alpha: 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
