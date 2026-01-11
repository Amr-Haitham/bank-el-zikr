import 'package:bank_el_ziker/legacy/1_ui/screens/zikr_content_screen/zikr_content_screen.dart';
import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';
import 'package:flutter/material.dart';


class ZikrCard extends StatelessWidget {
  final Zikr zikr;
  const ZikrCard({super.key, required this.zikr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ZikrContentScreen(zikr: zikr)));
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
            // const SizedBox(
            //   width: 10,
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 90,
              height: 33,
              child: Text(
                zikr.title ?? zikr.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
