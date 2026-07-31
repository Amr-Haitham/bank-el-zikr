import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

import '../cubit/adhkar_reading_cubit.dart';

class AdhkarViewModeToggle extends StatelessWidget {
  const AdhkarViewModeToggle({
    super.key,
    required this.viewMode,
    required this.onChanged,
  });

  final AdhkarViewMode viewMode;
  final ValueChanged<AdhkarViewMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ToggleButton(
            label: AppLocalizations.of(context).listViewLabel,
            icon: Icons.list,
            isSelected: viewMode == AdhkarViewMode.list,
            onTap: () => onChanged(AdhkarViewMode.list),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _ToggleButton(
            label: AppLocalizations.of(context).singleViewLabel,
            icon: Icons.view_agenda_outlined,
            isSelected: viewMode == AdhkarViewMode.single,
            onTap: () => onChanged(AdhkarViewMode.single),
          ),
        ),
      ],
    );
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? selectedColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: isSelected
                    ? selectedColor
                    : Theme.of(context).textTheme.bodySmall!.color,
              ),
            ),
            const SizedBox(width: 6),
            Icon(icon,
                size: 16,
                color: isSelected
                    ? selectedColor
                    : Theme.of(context).textTheme.bodySmall!.color),
          ],
        ),
      ),
    );
  }
}
