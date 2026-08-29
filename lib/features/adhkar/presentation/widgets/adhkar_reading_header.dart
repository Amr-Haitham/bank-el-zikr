import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:flutter/material.dart';

class AdhkarReadingHeader extends StatelessWidget {
  const AdhkarReadingHeader({
    super.key,
    required this.title,
    required this.completedCount,
    required this.totalCount,
    required this.onBack,
  });

  final String title;
  final int completedCount;
  final int totalCount;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onBack,
          child: Icon(isEnglish ? Icons.chevron_left : Icons.chevron_right,
              color: context.textTheme.bodyLarge!.color),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ConstantValues.spacingSm),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.headlineSmall!.copyWith(fontSize: 20),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: ConstantValues.spacingSm,
              vertical: ConstantValues.spacingXs),
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "${formatNumber(context, completedCount)}/${formatNumber(context, totalCount)}",
            style: context.textTheme.labelMedium!.copyWith(
              color: context.theme.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
