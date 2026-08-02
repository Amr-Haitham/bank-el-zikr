import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:flutter/material.dart';

/// Plain, borderless search field for the Adhkar List screen's own category
/// tiles — a filled pill rather than the outlined style used by
/// [ZikrSearchField] when searching within an expanded category's zikr list.
class AdhkarListSearchField extends StatelessWidget {
  const AdhkarListSearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String hintText;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final hintColor =
        context.textTheme.bodySmall!.color!.withValues(alpha: 0.5);
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final textDirection = isEnglish ? TextDirection.ltr : TextDirection.rtl;

    return TextField(
      onChanged: onChanged,
      textDirection: textDirection,
      style: context.textTheme.bodySmall,
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: textDirection,
        hintStyle: context.textTheme.bodySmall!.copyWith(color: hintColor),
        prefixIcon: Icon(Icons.search, color: hintColor),
        filled: true,
        fillColor: context.colors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
