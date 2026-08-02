import 'package:bank_el_ziker/core/utils/number_formatting.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AdhkarCounterRing extends StatelessWidget {
  const AdhkarCounterRing({
    super.key,
    required this.reps,
    required this.target,
  });

  final int reps;
  final int target;

  @override
  Widget build(BuildContext context) {
    final progress = target == 0 ? 0.0 : (reps / target).clamp(0.0, 1.0);

    return Column(
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 96,
                height: 96,
                child: CircularProgressIndicator(
                  value: progress == 0 ? 1 : progress,
                  strokeWidth: 6,
                  strokeCap: StrokeCap.round,
                  backgroundColor: Theme.of(context).cardColor,
                  valueColor: AlwaysStoppedAnimation<Color>(progress == 0
                      ? Theme.of(context).cardColor
                      : Theme.of(context).primaryColor),
                ),
              ),
              Text(
                formatNumber(context, reps),
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          AppLocalizations.of(context).ofCount(formatNumber(context, target)),
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 13,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          AppLocalizations.of(context).repetitionCountLabel,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context)
                .textTheme
                .bodySmall!
                .color!
                .withValues(alpha: 0.45),
          ),
        ),
      ],
    );
  }
}
