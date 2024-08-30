import 'package:bank_el_ziker/3_data/models/morning_or_night_zikr.dart';
import 'package:flutter/material.dart';

import 'morning_or_night_zikr_content_screen.dart';

class ZikerTile extends StatelessWidget {
  final MorningOrNightZikr zikr;
  final bool isMorningZiker;
  const ZikerTile(
      {super.key, required this.zikr, required this.isMorningZiker});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MorningOrNightZikrContentScreen(
                  zikr,
                  isMorningZikr: isMorningZiker,
                )));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(38)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 16, // Half of the width/height of your original Container
              backgroundColor: const Color.fromRGBO(255, 184, 0, 1),
              child: Center(
                child: Text(
                  zikr.count.toString(),
                  textAlign: TextAlign.center,
                  textHeightBehavior: const TextHeightBehavior(
                      leadingDistribution: TextLeadingDistribution.even,
                      applyHeightToLastDescent: false,
                      applyHeightToFirstAscent: false),
                  strutStyle: const StrutStyle(
                    // fontSize: 12.0, // Match this to your text size
                    height: 1.0,
                    forceStrutHeight:
                        true, // Forces the height to the font size
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
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
