import 'package:flutter/material.dart';

import 'settings_row_container.dart';

class SettingsToggleRow extends StatelessWidget {
  const SettingsToggleRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.activeIcon,
    this.inactiveIcon,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  /// Icon shown on the thumb when [value] is true.
  final IconData? activeIcon;

  /// Icon shown on the thumb when [value] is false.
  final IconData? inactiveIcon;

  @override
  Widget build(BuildContext context) {
    return SettingsRowContainer(
      label: label,
      control: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Colors.white,
        activeTrackColor: Theme.of(context).primaryColor,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Theme.of(context)
            .textTheme
            .bodySmall!
            .color!
            .withValues(alpha: 0.25),
        thumbIcon: (activeIcon == null && inactiveIcon == null)
            ? null
            : WidgetStateProperty.resolveWith((states) {
                final isOn = states.contains(WidgetState.selected);
                final icon = isOn ? activeIcon : inactiveIcon;
                if (icon == null) return null;
                return Icon(
                  icon,
                  size: 14,
                  color: isOn
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).textTheme.bodySmall!.color,
                );
              }),
      ),
    );
  }
}
