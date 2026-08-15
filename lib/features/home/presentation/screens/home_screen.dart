import 'package:bank_el_ziker/features/home/presentation/widgets/adhkar_status_row_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/hasanat_balance_card_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/home_header_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/next_reminder_banner.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/share_reward_row.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/streak_card_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/support_app_card_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/verse_of_day_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:bank_el_ziker/core/constants/constant_values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantValues.appHorizontalPadding),
              sliver: SliverList.list(
                children: const [
                  SizedBox(height: ConstantValues.appTopPadding),
                  HomeHeaderWidget(),
                  SizedBox(height: 16),
                  NextReminderBanner(),
                  SizedBox(height: 16),
                  HasanatBalanceCardWidget(),
                  SizedBox(height: 16),
                  AdhkarStatusRowWidget(),
                  SizedBox(height: 16),
                  StreakCardWidget(),
                  SizedBox(height: 16),
                  VerseOfDayCardWidget(),
                  SizedBox(height: 16),
                  SupportAppCardWidget(),
                  SizedBox(height: 24),
                  ShareRewardRow(),
                  SizedBox(height: ConstantValues.appBottomPadding),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
