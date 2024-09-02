import 'package:bank_el_ziker/1_ui/core/consts/constant_values.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/custom_app_button.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/2_state_management/settings/get_settings_cubit/get_settings_cubit.dart';
import 'package:bank_el_ziker/2_state_management/settings/set_settings_cubit/set_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isLightTheme = false;
  bool isMorningAzkarEnabled = false;
  bool isEveningAzkarEnabled = false;
  @override
  void initState() {
    BlocProvider.of<GetSettingsCubit>(context).getSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SetSettingsCubit, SetSettingsState>(
          listener: (context, state) {
            if (state is SetSettingsLoaded) {
              BlocProvider.of<GetSettingsCubit>(context).getSettings();
            }
          },
        ),
        BlocListener<GetSettingsCubit, GetSettingsState>(
          listener: (context, state) {
            if (state is GetSettingsLoaded) {
        
              setState(() {
                isLightTheme=state.isLightTheme;
              });
              
            }
          },
        ),
      ],
      child: Scaffold(
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
                  onChanged: (value) {
                    setState(() {
                      isLightTheme = value;
                      BlocProvider.of<SetSettingsCubit>(context)
                          .setTheme(isLightTheme: isLightTheme);
                    });
                  },
                  icon: isLightTheme ? Icons.wb_sunny : Icons.nights_stay,
                ),
                _buildSwitchTile(
                  text: 'أذكار الصباح',
                  value: isMorningAzkarEnabled,
                  onChanged: (value) {
                    setState(() {
                      isMorningAzkarEnabled = value;
                    });
                  },
                ),
                _buildSwitchTile(
                  text: 'أذكار المساء',
                  value: isEveningAzkarEnabled,
                  onChanged: (value) {
                    setState(() {
                      isEveningAzkarEnabled = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 48,
                ),
                CustomAppButton(
                  onPressed: () {},
                  text: "دعم التطبيق",
                  trailing: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomAppButton(
                  onPressed: () {},
                  text: "تواصل معنا",
                  trailing: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String text,
    required bool value,
    required Function(bool) onChanged,
    IconData? icon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform.scale(
          scaleX: -1,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Theme.of(context).primaryColor,
            inactiveThumbColor: Colors.grey,
          ),
        ),
        Row(
          children: [
            if (icon != null)
              Icon(icon,
                  color: value ? Theme.of(context).primaryColor : Colors.grey),
            const SizedBox(width: 8),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
