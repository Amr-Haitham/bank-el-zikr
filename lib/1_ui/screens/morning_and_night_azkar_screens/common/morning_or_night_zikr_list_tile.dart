import 'package:bank_el_ziker/3_data/models/morning_or_night_zikr.dart';
import 'package:flutter/material.dart';

import 'morning_or_night_zikr_content_screen.dart';

class MorningOrNightZikrListTile extends StatelessWidget {
  final MorningOrNightZikr zikr;
  final bool isMorningZiker;
  final Widget? trailing;
  final Function() onTap;
  const MorningOrNightZikrListTile(
      {super.key,
      required this.zikr,
      required this.isMorningZiker,
      required this.onTap,
      this.trailing});

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
            trailing ?? SizedBox.shrink(),
            trailing != null
                ? const SizedBox(
                    width: 12,
                  )
                : SizedBox.shrink(),
            Expanded(
              child: Text(
                zikr.title ?? zikr.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
