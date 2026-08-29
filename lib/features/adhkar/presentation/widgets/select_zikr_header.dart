import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
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
          style:
              IconButton.styleFrom(backgroundColor: context.theme.primaryColor),
          icon: Icon(
            Icons.add,
            color: context.colors.onPrimary,
          ),
        ),
        Expanded(
          child: Text(
            "اختر الذكر",
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.headlineSmall,
          ),
        ),
        GestureDetector(
          onTap: () => context.router.maybePop(),
          child: Icon(
            Icons.arrow_forward,
            color: context.textTheme.bodyLarge!.color,
          ),
        ),
      ],
    );
  }
}
