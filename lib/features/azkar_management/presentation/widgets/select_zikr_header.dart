import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SelectZikrHeader extends StatelessWidget {
  const SelectZikrHeader({super.key, required this.onAddPressed});

  final VoidCallback onAddPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onAddPressed,
          style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor),
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        Text(
          "اختر الذكر",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        GestureDetector(
          onTap: () => context.router.maybePop(),
          child: Icon(
            Icons.arrow_forward,
            color: Theme.of(context).textTheme.bodyLarge!.color,
          ),
        ),
      ],
    );
  }
}
