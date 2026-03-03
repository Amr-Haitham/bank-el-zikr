import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/custom_app_button.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/support_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLightTheme = false;
  bool isVibrating = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, RequestState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          success: (settings) {
            setState(() {
              isLightTheme = settings.isLightTheme;
              isVibrating = settings.isVibrating;
            });
          },
          failure: (failure) {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: ConstantValues.appTopPadding,
                  right: ConstantValues.appHorizontalPadding,
                  left: ConstantValues.appHorizontalPadding),
              child: Column(
                children: [
                  const TitleWithBackButton(title: "الإعدادات"),
                  const SizedBox(
                    height: 50,
                  ),
                  _buildSwitchTile(
                    text: 'سمة البرنامج',
                    value: isLightTheme,
                    activeIcon: Icon(
                      Icons.wb_sunny,
                      color: Theme.of(context).primaryColor,
                    ),
                    inActiveIcon: const Icon(Icons.nights_stay),
                    inActiveColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      setState(() {
                        isLightTheme = value;
                      });
                      context.read<SettingsCubit>().setTheme(isLightTheme);
                    },
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  _buildSwitchTile(
                    text: 'الأهتزاز',
                    value: isVibrating,
                    onChanged: (value) {
                      setState(() {
                        isVibrating = value;
                      });
                      context.read<SettingsCubit>().setVibration(isVibrating);
                    },
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  CustomAppButton(
                    onPressed: () {
                      context.read<SupportCubit>().launchCharityLink();
                    },
                    text: "دعم التطبيق",
                    trailing: const Icon(
                      Icons.arrow_back_ios,
                      color: appWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomAppButton(
                    onPressed: () {
                      context.read<SupportCubit>().launchEmail();
                    },
                    text: "تواصل معنا",
                    trailing: const Icon(
                      Icons.email_outlined,
                      color: appWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSwitchTile({
    required String text,
    required bool value,
    Icon? activeIcon,
    Icon? inActiveIcon,
    Color? inActiveColor,
    required Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          height: 36,
          width: 78,
          child: Transform.scale(
            scaleX: -1,
            // fit: BoxFit.fitHeight,
            child: FlutterSwitch(
              activeIcon: activeIcon,
              inactiveIcon: inActiveIcon,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: inActiveColor ?? appInactiveSwitch,
              valueFontSize: 25.0,
              value: value,
              borderRadius: 30.0,
              showOnOff: false,
              onToggle: onChanged,
            ),

          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
