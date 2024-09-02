import 'package:bank_el_ziker/1_ui/re-usable%20widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/3_data/models/morning_or_night_zikr.dart';
import 'package:flutter/material.dart';
import '../../../core/consts/constant_values.dart';
import '../../../re-usable widgets/zikr_repetition_count_circle.dart';

class MorningOrNightZikrContentScreen extends StatefulWidget {
  final List<MorningOrNightZikr> azkar;
  final bool isMorningZikr;
  final int index;
  const MorningOrNightZikrContentScreen(
      {super.key,
      required this.isMorningZikr,
      required this.azkar,
      required this.index});
  @override
  State<MorningOrNightZikrContentScreen> createState() =>
      _MorningOrNightZikrContentScreenState();
}

class _MorningOrNightZikrContentScreenState
    extends State<MorningOrNightZikrContentScreen> {
  late int currentZikrIndex;
 
  late int indexOfLastZikr;
  double widthOfNextAndPreviousButtons = 40;
  @override
  void initState() {
    super.initState();
    currentZikrIndex = widget.index;

    indexOfLastZikr = widget.azkar.length-1;
  }

  bool _checkIfNextIsAvailable() {
    return currentZikrIndex < indexOfLastZikr;
  }

  bool _checkIfPreviousIsAvailable() {
    return currentZikrIndex > 0;
  }

  @override
  Widget build(BuildContext context) {
    // print("new state");
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.only(
              top: ConstantValues.appTopPadding,
              left: ConstantValues.appHorizontalPadding,
              right: ConstantValues.appHorizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleWithBackButton(
                  title: widget.isMorningZikr ? "أذكار الصباح" : "أذكار المساء"),
              Expanded(
                  child: Center(
                      child: zikrContainer(
                          morningOrNightZikr: widget.azkar[currentZikrIndex]))),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _checkIfNextIsAvailable()
                        ? nextButton()
                        : Container(
                            width: widthOfNextAndPreviousButtons,
                          ),
                    Expanded(
                      child: ZikrRepetitonCountCircle(
                        key: GlobalKey(),
                        count: widget.azkar[currentZikrIndex].count,
                        isMorningZikr: widget.isMorningZikr,
                        onFinished: () {
                          if (_checkIfNextIsAvailable()) {
                            setState(() {
                              currentZikrIndex++;
                            });
                          }
                        },
                      ),
                    ),
                    _checkIfPreviousIsAvailable()
                        ? previousButton()
                        : Container(
                            width: widthOfNextAndPreviousButtons,
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget zikrContainer({required MorningOrNightZikr morningOrNightZikr}) {
    // MorningOrNightZikr currentMorningOrNightZikr = morningOrNightAzkarList
    //     .firstWhere((zikr) => zikr.id.toInt() == currentZikrIndex);

    // // String zikrTitle = currentMorningOrNightZikr.title ?? '';

    // String zikrContent = currentMorningOrNightZikr.content;

    // int zikrCount = currentMorningOrNightZikr.count;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width - 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            morningOrNightZikr.content,
            textAlign: TextAlign.center,textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget nextButton() {
    return IconButton(
      onPressed: () {
        if (_checkIfNextIsAvailable()) {
          print("hellooo");
          print(currentZikrIndex);
          print(indexOfLastZikr);
          print(widget.azkar.length);

          setState(() {
            currentZikrIndex++;
          });
        }
      },
      icon: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          width: widthOfNextAndPreviousButtons,
          height: widthOfNextAndPreviousButtons,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
    );
  }

  Widget previousButton() {
    return IconButton(
      onPressed: () {
        if (_checkIfPreviousIsAvailable()) {
          setState(() {
            currentZikrIndex--;
          });
        }
      },
      icon: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          width: widthOfNextAndPreviousButtons,
          height: widthOfNextAndPreviousButtons,
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          )),
    );
  }
}
