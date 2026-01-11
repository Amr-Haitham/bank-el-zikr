import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/presentation/widgets/title_with_back_button.dart';
import 'package:flutter/material.dart';
import '../widgets/build_list_of_azkar_widget.dart';

class MorningOrNightAzkarScreen extends StatelessWidget {
  const MorningOrNightAzkarScreen({super.key, required this.isMorning});
  final bool isMorning;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: const EdgeInsets.only(
              top: ConstantValues.appTopPadding,
              left: ConstantValues.appHorizontalPadding,
              right: ConstantValues.appHorizontalPadding),
          child: CustomScrollView(
            slivers: [
              // const SliverToBoxAdapter(
              //     child: SizedBox(
              //   height: 14,
              // )),
              isMorning
                  ? const SliverToBoxAdapter(
                      child: TitleWithBackButton(title: "أذكار الصباح"))
                  : const SliverToBoxAdapter(
                      child: TitleWithBackButton(title: "أذكار المساء")),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 41,
              )),
              BuildListOfAzkarWidget(
                isMorningAzkar: isMorning,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
