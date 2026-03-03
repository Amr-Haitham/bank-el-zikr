import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/custom_app_button.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/custom_app_text_field.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/input_formatters.dart';

class GoalSettingBottomSheet extends StatelessWidget {
  final TextEditingController goalController;
  final BuildContext parentContext;

  const GoalSettingBottomSheet({
    super.key,
    required this.goalController,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: ConstantValues.appTopPadding,
        right: ConstantValues.appHorizontalPadding,
        left: ConstantValues.appHorizontalPadding,
      ),
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
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
            const SizedBox(height: 35),
            Center(
              child: Text(
                'سيهتز الهاتف عند بلوغ الهدف',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 35),
            CustomAppTextField(
              title: "إضافة الهدف",
              keyboardType: TextInputType.number,
              controller: goalController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                NoLeadingZeroInputFormatter(),
                WhitespaceInputFormatter(),
              ],
            ),
            const SizedBox(height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomAppButton(
                    onPressed: () {
                      final goal = int.tryParse(goalController.text);
                      if (goal != null) {
                        parentContext.read<CounterCubit>().setGoal(goal);
                        parentContext.read<CounterCubit>().setCounter(0);
                        Navigator.pop(context);
                      }
                    },
                    text: "حفظ",
                  ),
                ),
              ],
            ),
            const SizedBox(height: ConstantValues.appBottomPadding),
          ],
        ),
      ),
    );
  }
}
