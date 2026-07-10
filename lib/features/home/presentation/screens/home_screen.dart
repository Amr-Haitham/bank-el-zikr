import 'package:bank_el_ziker/core/constants/third_party_values.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/adhkar_status_row_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/hasanat_balance_card_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/home_header_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/streak_card_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/support_app_card_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/verse_of_day_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'package:bank_el_ziker/core/constants/constant_values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ConstantValues.appHorizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: ConstantValues.appTopPadding),
                const HomeHeaderWidget(),
                const SizedBox(height: 20),
                const HasanatBalanceCardWidget(),
                const SizedBox(height: 16),
                const AdhkarStatusRowWidget(),
                const SizedBox(height: 16),
                const StreakCardWidget(),
                const SizedBox(height: 16),
                const VerseOfDayCardWidget(),
                const SizedBox(height: 16),
                const SupportAppCardWidget(),
                const SizedBox(height: 24),
                _shareWithFriends(context),
                const SizedBox(height: ConstantValues.appBottomPadding),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _shareWithFriends(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SharePlus.instance.share(ShareParams(text: ThirdPartyValues.appLink));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.share_outlined,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 10),
          Text(
            "شارك الأجر مع أصدقاءك",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
