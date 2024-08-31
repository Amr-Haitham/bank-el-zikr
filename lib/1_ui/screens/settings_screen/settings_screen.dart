import 'package:bank_el_ziker/1_ui/core/consts/constant_values.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/custom_app_button.dart';
import 'package:bank_el_ziker/1_ui/re-usable%20widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/4_utility_functions/screen_utils.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkTheme = false;
  bool isMorningAzkarEnabled = false;
  bool isEveningAzkarEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:const EdgeInsets.only(
              top: ConstantValues.appTopPadding,
              right: ConstantValues.appHorizontalPadding,
              left: ConstantValues.appHorizontalPadding),
          child: Column(
            children: [
              const TitleWithBackButton(title: "الإعدادات"),
              const SizedBox(height: 50,),
              _buildSwitchTile(
                text: 'سمة البرنامج',
                value: isDarkTheme,
                onChanged: (value) {
                  setState(() {
                    isDarkTheme = value;
                  });
                },
                icon: isDarkTheme ? Icons.nights_stay : Icons.wb_sunny,
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
              ),         SizedBox(height: 48,),
              CustomAppButton(onPressed: (){}, text: "دعم التطبيق",trailing: Icon(Icons.arrow_back_ios,color: Colors.white,),),
            SizedBox(height: 24,),
              CustomAppButton(onPressed: (){}, text: "تواصل معنا",trailing:Icon(Icons.arrow_back_ios,color: Colors.white,) ,),
            ],
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
              Icon(icon, color: value ? Theme.of(context).primaryColor : Colors.grey),
            const SizedBox(width: 8),
            Text(
              text,
              style:  Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
