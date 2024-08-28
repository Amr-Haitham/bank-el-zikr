import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:flutter/material.dart';

class TitleWithBackButton extends StatelessWidget {
  final String? title;

  const TitleWithBackButton({super.key, required this.title, required});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.headlineMedium,
              )
            : const SizedBox.shrink(),
            SizedBox(width: 8,),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_forward,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
      ],
    );
  }
}
