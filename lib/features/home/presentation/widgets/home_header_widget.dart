import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).homeTitle,
          style: context.textTheme.headlineSmall!
              .copyWith(fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          AppLocalizations.of(context).homeSubtitle,
          style: context.textTheme.bodySmall!.copyWith(
                fontSize: 14,
                color: context.theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
