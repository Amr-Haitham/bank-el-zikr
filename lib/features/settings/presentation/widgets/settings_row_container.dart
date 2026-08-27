import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:flutter/material.dart';

/// The dark rounded-card row shell shared by every settings row —
/// a label on the start side and an arbitrary control on the end side.
class SettingsRowContainer extends StatelessWidget {
  const SettingsRowContainer({
    super.key,
    required this.label,
    required this.control,
  });

  final String label;
  final Widget control;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: context.textTheme.bodyMedium!
                .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          control,
        ],
      ),
    );
  }
}
