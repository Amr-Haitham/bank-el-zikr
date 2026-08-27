import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class TimePickerBottomSheet extends StatefulWidget {
  const TimePickerBottomSheet({
    super.key,
    required this.title,
    required this.initialTime,
  });

  final String title;
  final TimeOfDay initialTime;

  static Future<TimeOfDay?> show(
    BuildContext context, {
    required String title,
    required TimeOfDay initialTime,
  }) {
    return showModalBottomSheet<TimeOfDay>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) =>
          TimePickerBottomSheet(title: title, initialTime: initialTime),
    );
  }

  @override
  State<TimePickerBottomSheet> createState() => _TimePickerBottomSheetState();
}

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  late int _hour12;
  late int _minute;
  late bool _isAm;

  late final FixedExtentScrollController _hourController;
  late final FixedExtentScrollController _minuteController;

  @override
  void initState() {
    super.initState();
    final hour = widget.initialTime.hour;
    _isAm = hour < 12;
    _hour12 = hour % 12 == 0 ? 12 : hour % 12;
    _minute = widget.initialTime.minute;
    _hourController = FixedExtentScrollController(initialItem: _hour12 - 1);
    _minuteController = FixedExtentScrollController(initialItem: _minute);
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  void _save() {
    final hour24 = _isAm
        ? (_hour12 == 12 ? 0 : _hour12)
        : (_hour12 == 12 ? 12 : _hour12 + 12);
    Navigator.of(context).pop(TimeOfDay(hour: hour24, minute: _minute));
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    String digits(Object value) =>
        isArabic ? ArabicNumbers().convert(value) : value.toString();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.textTheme.bodySmall!.color!
                    .withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 38),
                Text(widget.title, style: context.textTheme.headlineSmall),
                GestureDetector(
                  onTap: () => Navigator.of(context).maybePop(),
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: context.colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.close,
                      size: 20,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Directionality(
              // Hour-left, minute-right must stay fixed regardless of the
              // app's language direction — only the digit glyphs (Western
              // vs Arabic-Indic) should follow the user's numerals setting.
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _NumberWheel(
                    controller: _hourController,
                    itemCount: 12,
                    columnLabel: AppLocalizations.of(context).hoursLabel,
                    labelBuilder: (index) => digits(index + 1),
                    onSelected: (index) =>
                        setState(() => _hour12 = index + 1),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _WheelColumnSpacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(':',
                            style: context.textTheme.headlineMedium),
                      ),
                    ],
                  ),
                  _NumberWheel(
                    controller: _minuteController,
                    itemCount: 60,
                    columnLabel: AppLocalizations.of(context).minutesLabel,
                    labelBuilder: (index) =>
                        digits(index.toString().padLeft(2, '0')),
                    onSelected: (index) => setState(() => _minute = index),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _WheelColumnSpacer(),
                      _AmPmToggle(
                        isAm: _isAm,
                        amLabel: AppLocalizations.of(context).am,
                        pmLabel: AppLocalizations.of(context).pm,
                        onChanged: (isAm) => setState(() => _isAm = isAm),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.theme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context).save,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

/// Matches the height of a wheel column's label + up-chevron, so the colon
/// and AM/PM toggle line up with the number wheels instead of the labels.
class _WheelColumnSpacer extends StatelessWidget {
  const _WheelColumnSpacer();

  @override
  Widget build(BuildContext context) => const SizedBox(height: 46);
}

class _NumberWheel extends StatelessWidget {
  const _NumberWheel({
    required this.controller,
    required this.itemCount,
    required this.columnLabel,
    required this.labelBuilder,
    required this.onSelected,
  });

  final FixedExtentScrollController controller;
  final int itemCount;
  final String columnLabel;
  final String Function(int index) labelBuilder;
  final ValueChanged<int> onSelected;

  void _step(int delta) {
    final next = (controller.selectedItem + delta).clamp(0, itemCount - 1);
    controller.animateToItem(
      next,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          columnLabel,
          style: context.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        IconButton(
          onPressed: () => _step(-1),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 28),
          iconSize: 20,
          icon: Icon(Icons.keyboard_arrow_up,
              color: context.textTheme.bodySmall!.color),
        ),
        SizedBox(
          width: 64,
          height: 120,
          child: ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 40,
            perspective: 0.005,
            diameterRatio: 1.4,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: onSelected,
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: itemCount,
              builder: (context, index) {
                return Center(
                  child: Text(
                    labelBuilder(index),
                    style: context.textTheme.headlineSmall,
                  ),
                );
              },
            ),
          ),
        ),
        IconButton(
          onPressed: () => _step(1),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 32, minHeight: 28),
          iconSize: 20,
          icon: Icon(Icons.keyboard_arrow_down,
              color: context.textTheme.bodySmall!.color),
        ),
      ],
    );
  }
}

class _AmPmToggle extends StatelessWidget {
  const _AmPmToggle({
    required this.isAm,
    required this.amLabel,
    required this.pmLabel,
    required this.onChanged,
  });

  final bool isAm;
  final String amLabel;
  final String pmLabel;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _AmPmOption(
          label: amLabel,
          isSelected: isAm,
          onTap: () => onChanged(true),
        ),
        const SizedBox(height: 8),
        _AmPmOption(
          label: pmLabel,
          isSelected: !isAm,
          onTap: () => onChanged(false),
        ),
      ],
    );
  }
}

class _AmPmOption extends StatelessWidget {
  const _AmPmOption({
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
      child: Container(
        width: 48,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? context.theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? context.theme.primaryColor
                : context.textTheme.bodySmall!.color!.withValues(alpha: 0.3),
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: context.textTheme.labelLarge?.copyWith(
            color: isSelected ? Colors.white : context.textTheme.bodySmall!.color,
          ),
        ),
      ),
    );
  }
}
