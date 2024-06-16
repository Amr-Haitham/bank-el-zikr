import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/azkar_circles.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/situations_azkar_card.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/morning_and_night_azkar_cards_in_one_column.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/random_ziker_container.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/tasbeeh_card.dart';
import 'package:bank_el_ziker/1_ui/screens/home_screen/widgets/ziker_balance_widget.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_general_data/get_general_data_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:bank_el_ziker/4_utility_functions/screen_utils.dart';
import 'package:bank_el_ziker/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import '../../../consts/initial_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateGeneralDataCubit, UpdateGeneralDataState>(
      listener: (context, state) {
        if (state is UpdateGeneralDataUpdated) {
          BlocProvider.of<GetGeneralDataCubit>(context).getGeneralData();
        }
      },
      child: Scaffold(
        backgroundColor: appWhite,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 65,
              ),
              const ZikerBalanceWidget(),
              const SizedBox(height: 20),
              const AzkarCicles(),
              const SizedBox(height: 20),
              const TasbeehCard(),
              const SizedBox(height: 20),
              const RandomZikerContainer(),
              const SizedBox(height: 40),
              shareWithFriends(),
            ],
          ),
        ),
      ),
    );
  }

  Widget shareWithFriends() {
    return GestureDetector(
      onTap: () {
        Share.share(InitialData.shareMessage);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.share,
            color: appGreen,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "شارك الأجر مع أصدقاءك",
            style: TextStyle(
                color: appGreen, fontSize: 16, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Widget background() {
    return SizedBox(
      height: ScreenUtils.getScreenHeight(context) - 600,
      width: ScreenUtils.getScreenWidth(context) - 50,
      child: Stack(
        children: [
          Positioned(
            right: -55,
            bottom: -400,
            child: SizedBox(
              height: ScreenUtils.getScreenHeight(context) - 200,
              child: Image.asset("assets/images/background.png"),
            ),
          ),
        ],
      ),
    );
  }

  Widget allAzkarWidget() {
    return Stack(
      children: [
        background(),
        const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SituationsAzkarCard(),
                MonringAndNightAzkarCardsInOneColumn(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
