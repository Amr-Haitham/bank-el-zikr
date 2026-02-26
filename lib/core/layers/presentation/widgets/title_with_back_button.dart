import 'package:flutter/material.dart';

class TitleWithBackButton extends StatelessWidget {
  final String? title;
  final Widget? trailing; 
  const TitleWithBackButton({super.key, required this.title,  this.trailing });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        trailing ?? const SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            title != null
                ? Text(
                    title!,
                    style: Theme.of(context).textTheme.headlineSmall,
                  )
                : const SizedBox.shrink(),
                const SizedBox(width: 8,),
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
        ),
      ],
    );
  }
}
