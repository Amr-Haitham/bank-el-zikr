import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/directional_chevron.dart';
import 'package:flutter/material.dart';

class ReminderTimeCard extends StatelessWidget {
  const ReminderTimeCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.label,
    required this.timeText,
    this.enabled,
    this.onToggle,
    this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String label;
  final String timeText;

  /// Null when this card has no toggle (e.g. the read-only Auto-mode card).
  final bool? enabled;
  final ValueChanged<bool>? onToggle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: ConstantValues.spacingLg,
            vertical: ConstantValues.spacingMd),
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    timeText,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: iconColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            if (enabled != null)
              Switch(
                value: enabled!,
                onChanged: onToggle,
                activeThumbColor: Colors.white,
                activeTrackColor: context.theme.primaryColor,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor:
                    context.textTheme.bodySmall!.color!.withValues(alpha: 0.25),
              )
            else
              Icon(
                Icons.wb_sunny_outlined,
                color: context.textTheme.bodySmall!.color,
              ),
            if (onTap != null) ...[
              const SizedBox(width: 6),
              DirectionalChevron(
                size: 16,
                color:
                    context.textTheme.bodySmall!.color!.withValues(alpha: 0.4),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
