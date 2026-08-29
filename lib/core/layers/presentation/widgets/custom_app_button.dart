import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key, required this.onPressed, this.trailing, required this.text});
  final Function() onPressed;
  final Widget? trailing;
  final String text;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: context.theme.primaryColor,
        side: const BorderSide(style: BorderStyle.none),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              39.0), // Set your desired border radius here
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(ConstantValues.spacingLg),
        child: Row(
          mainAxisAlignment: trailing == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            trailing ?? const SizedBox.shrink(),
            Text(
              text,
              style: context.textTheme.bodyMedium!.copyWith(
                  color:
                      GeneralUtils.isLightTheme(context) ? appWhite : appDark,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
