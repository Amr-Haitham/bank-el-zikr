import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

class SituationalZikrListTile extends StatelessWidget {
  final Zikr zikr;
  final Widget? trailing;
  final Function() onTap;
  const SituationalZikrListTile(
      {super.key, required this.zikr, required this.onTap, this.trailing});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(38)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            trailing ?? const SizedBox.shrink(),
            trailing != null
                ? const SizedBox(
                    width: 12,
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: Text(
                zikr.title ?? zikr.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
