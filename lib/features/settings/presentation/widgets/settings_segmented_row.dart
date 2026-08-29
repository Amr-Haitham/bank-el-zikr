import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:flutter/material.dart';

import 'settings_row_container.dart';

class SettingsSegmentedRow extends StatelessWidget {
  const SettingsSegmentedRow({
    super.key,
    required this.label,
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
    this.optionFontSizes,
    this.optionFontFamilies,
  });

  final String label;
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  /// Optional per-option font size, so choices that represent a visual
  /// property (e.g. text size) can actually preview that size.
  final List<double>? optionFontSizes;

  /// Optional per-option font family, so choices that represent a font
  /// preview that font instead of the settings screen's own UI font.
  final List<String>? optionFontFamilies;

  @override
  Widget build(BuildContext context) {
    return SettingsRowContainer(
      label: label,
      control: Container(
        padding: const EdgeInsets.all(ConstantValues.spacingXs),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(options.length, (index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () => onSelected(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(
                    horizontal: ConstantValues.spacingMd,
                    vertical: ConstantValues.spacingSm),
                decoration: BoxDecoration(
                  color: isSelected
                      ? context.theme.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Text(
                  options[index],
                  style: TextStyle(
                    fontSize: optionFontSizes?[index] ?? 13,
                    fontFamily: optionFontFamilies?[index],
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? Colors.white
                        : context.textTheme.bodySmall!.color!
                            .withValues(alpha: 0.6),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
