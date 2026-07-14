import 'package:bank_el_ziker/core/constants/constant_values.dart';
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
  State<GoalSettingBottomSheet> createState() =>
      _GoalSettingBottomSheetState();
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
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        top: 12,
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
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color!
                    .withValues(alpha: 0.2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Set goal",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Text(
              "The phone vibrates at each completed lap",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .color!
                    .withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
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
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w800),
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
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () => _selectPreset(preset),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  preset.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
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
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 14),
            GestureDetector(
              onTap: _removeGoal,
              child: Text(
                "Remove goal",
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
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
