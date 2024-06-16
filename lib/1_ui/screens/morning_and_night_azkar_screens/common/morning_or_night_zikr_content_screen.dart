import 'package:bank_el_ziker/1_ui/screens/morning_and_night_azkar_screens/common/build_list_of_azkar_widget.dart';
import 'package:bank_el_ziker/3_data/models/morning_or_night_zikr.dart';
import 'package:bank_el_ziker/consts/colors.dart';
import 'package:flutter/material.dart';
import '../../../re-usable widgets/zikr_repetition_count_circle.dart';
import '../morning_azkar_screen/components/upper_bar_widget.dart';
import '../night_azkar_screen/components/upper_bar_widget.dart';

class MorningOrNightZikrContentScreen extends StatefulWidget {
  final MorningOrNightZikr zikr;
  final bool isMorningZikr;
  const MorningOrNightZikrContentScreen(this.zikr,
      {super.key, required this.isMorningZikr});
  @override
  State<MorningOrNightZikrContentScreen> createState() =>
      _MorningOrNightZikrContentScreenState();
}

class _MorningOrNightZikrContentScreenState
    extends State<MorningOrNightZikrContentScreen> {
  late int currentZikrIndex;
  late int indexOfFirstZikr;
  late int indexOfLastZikr;
  double widthOfNextAndPreviousButtons = 150;
  @override
  void initState() {
    super.initState();
    currentZikrIndex = widget.zikr.id;
    indexOfFirstZikr = morningOrNightAzkarList.first.id;
    indexOfLastZikr = morningOrNightAzkarList.last.id;
  }

  @override
  Widget build(BuildContext context) {
    // print("new state");
    return Material(
      color: appWhite,
      child: Column(
        children: [
          widget.isMorningZikr
              ? const MorningAzkarScreenUpperBarWidget()
              : const NightAzkarScreenUpperBarWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: zikrContainer(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                currentZikrIndex < indexOfLastZikr
                    ? nextButton()
                    : Container(
                        width: widthOfNextAndPreviousButtons,
                      ),
                currentZikrIndex > indexOfFirstZikr
                    ? previousButton()
                    : Container(
                        width: widthOfNextAndPreviousButtons,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget zikrContainer() {
    MorningOrNightZikr currentMorningOrNightZikr = morningOrNightAzkarList
        .firstWhere((zikr) => zikr.id.toInt() == currentZikrIndex);

    String zikrTitle = currentMorningOrNightZikr.title ?? '';

    String zikrContent = currentMorningOrNightZikr.content;

    int zikrCount = currentMorningOrNightZikr.count;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width - 10,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              zikrTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: appGreen,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    zikrContent,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: appDarkTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ZikrRepetitonCountCircle(
              key: GlobalKey(),
              count: zikrCount,
              isMorningZikr: widget.isMorningZikr,
            ),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return GestureDetector(
      onTap: () {
        if (currentZikrIndex < indexOfLastZikr) {
          setState(() {
            currentZikrIndex++;
          });
        }
      },
      child: Container(
        width: widthOfNextAndPreviousButtons,
        decoration: BoxDecoration(
          color: (currentZikrIndex < indexOfLastZikr ? appGreen : Colors.white),
          border: Border.all(
            color:
                (currentZikrIndex < indexOfLastZikr ? Colors.white : appGreen),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: (currentZikrIndex < indexOfLastZikr
                    ? Colors.white
                    : appGreen),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "التالي",
                style: TextStyle(
                  fontSize: 18,
                  color: (currentZikrIndex < indexOfLastZikr
                      ? Colors.white
                      : appGreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget previousButton() {
    return GestureDetector(
      onTap: () {
        if (currentZikrIndex > indexOfFirstZikr) {
          setState(() {
            currentZikrIndex--;
          });
        }
      },
      child: Container(
        width: widthOfNextAndPreviousButtons,
        decoration: BoxDecoration(
          color:
              (currentZikrIndex > indexOfFirstZikr ? appGreen : Colors.white),
          border: Border.all(
            color:
                (currentZikrIndex > indexOfFirstZikr ? Colors.white : appGreen),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "السابق",
                style: TextStyle(
                  fontSize: 18,
                  color: (currentZikrIndex > indexOfFirstZikr
                      ? Colors.white
                      : appGreen),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: (currentZikrIndex > indexOfFirstZikr
                    ? Colors.white
                    : appGreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
