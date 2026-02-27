import 'package:bank_el_ziker/features/home/presentation/widgets/azkar_home_widgets.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/date_settings_welcome_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/random_ziker_container.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/streak_card_widget.dart';
import 'package:bank_el_ziker/features/home/presentation/widgets/ziker_balance_widget.dart';
import 'package:flutter/material.dart';

import 'package:bank_el_ziker/core/constants/constant_values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: ConstantValues.appHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 16),
              DateSettingsWelcomeWidget(),
              SizedBox(height: 20),
              ZikerBalanceWidget(),
              SizedBox(height: 16),
              AzkarHomeWidgets(),
              SizedBox(height: 16),
              StreakCardWidget(consecutiveDays: 12),
              SizedBox(height: 16),
              RandomZikerContainer(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
