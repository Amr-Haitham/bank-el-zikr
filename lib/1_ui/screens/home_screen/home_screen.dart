import 'package:bank_el_ziker/1_ui/core/consts/third_party_values.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/azkar_home_widgets.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/date_settings_welcome_widget.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/random_ziker_container.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/ziker_balance_widget.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/consts/constant_values.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // BlocProvider.of<GetHijriDateCubit>(context).getHijriDate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateGeneralDataCubit, UpdateGeneralDataState>(
      listener: (context, state) {
        if (state is UpdateGeneralDataUpdated) {
          BlocProvider.of<GetGeneralDataCubit>(context).getGeneralData();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:ConstantValues.appHorizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: ConstantValues.appTopPadding,
                ),
                const DateSettingsWelcomeWidget(),
                const ZikerBalanceWidget(),
                const SizedBox(height: 20),
                const AzkarHomeWidgets(),
                const SizedBox(height: 20),
                const RandomZikerContainer(),
                const SizedBox(height: 40),
                shareWithFriends(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shareWithFriends() {
    return GestureDetector(
      onTap: () {
        Share.share(ThirdPartyValues.appLink);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.share_outlined,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "شارك الأجر مع أصدقاءك",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}