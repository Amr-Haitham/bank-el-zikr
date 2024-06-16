import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/morning_azkar_card.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/night_azkar_card.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/situations_azkar_card.dart';
import 'package:flutter/cupertino.dart';

class AzkarCicles extends StatelessWidget {
  const AzkarCicles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MorningAzkarCard(),
        NightAzkarCard(),
        SituationsAzkarCard(),
      ],
    );
  }
}
