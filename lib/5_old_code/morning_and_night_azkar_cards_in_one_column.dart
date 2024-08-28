import 'package:flutter/cupertino.dart';

import 'morning_azkar_card.dart';
import 'night_azkar_card.dart';

class MonringAndNightAzkarCardsInOneColumn extends StatelessWidget {
  const MonringAndNightAzkarCardsInOneColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MorningAzkarCard(),
        SizedBox(
          height: 10,
        ),
        NightAzkarCard(),
      ],
    );
  }
}

