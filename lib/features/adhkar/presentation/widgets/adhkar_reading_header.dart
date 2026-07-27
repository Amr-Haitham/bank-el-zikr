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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textDirection: TextDirection.rtl,
      children: [
        GestureDetector(
          onTap: onBack,
          child: Icon(Icons.chevron_right,
              color: Theme.of(context).textTheme.bodyLarge!.color),
        ),
        Text(
          title,
          textDirection: TextDirection.rtl,
          style:
              Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 20),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "${formatNumber(context, completedCount)}/${formatNumber(context, totalCount)}",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
