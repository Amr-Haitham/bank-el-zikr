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
        backgroundColor: Theme.of(context).primaryColor,
        side: const BorderSide(style: BorderStyle.none),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              39.0), // Set your desired border radius here
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: trailing == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            trailing ?? const SizedBox.shrink(),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
