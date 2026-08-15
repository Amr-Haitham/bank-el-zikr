import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:flutter/material.dart';

class ReminderTimingRow extends StatelessWidget {
  const ReminderTimingRow({
    super.key,
    required this.isAuto,
    required this.onChanged,
    required this.timingLabel,
    required this.manualLabel,
    required this.autoLabel,
  });

  final bool isAuto;
  final ValueChanged<bool> onChanged;
  final String timingLabel;
  final String manualLabel;
  final String autoLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _TimingOption(
                  label: manualLabel,
                  isSelected: !isAuto,
                  onTap: () => onChanged(false),
                ),
                _TimingOption(
                  label: autoLabel,
                  isSelected: isAuto,
                  onTap: () => onChanged(true),
                ),
              ],
            ),
          ),
          Text(
            timingLabel,
            style: context.textTheme.bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.access_time_rounded,
              size: 20,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _TimingOption extends StatelessWidget {
  const _TimingOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? context.theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isSelected
                ? Colors.white
                : context.textTheme.bodySmall!.color!.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}
