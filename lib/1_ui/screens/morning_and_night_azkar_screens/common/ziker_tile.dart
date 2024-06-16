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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                // width: MediaQuery.of(context).size.width - 100,
                child: Text(
                  zikr.title ?? zikr.content,
                  maxLines: 1,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
