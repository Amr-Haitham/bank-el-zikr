import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isLight = GeneralUtils.isLightTheme(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bank el Dhikr",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 24),
            ),
            const SizedBox(height: 4),
            Text(
              "Your daily fortress",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            AutoRouter.of(context).push(const SettingsRoute());
          },
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).cardColor,
          ),
          icon: Icon(
            Icons.settings_outlined,
            color: isLight ? Colors.black87 : Colors.white,
          ),
        ),
      ],
    );
  }
}
