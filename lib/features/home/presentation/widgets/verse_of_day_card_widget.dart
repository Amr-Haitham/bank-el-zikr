import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:bank_el_ziker/features/home/domain/entities/prayer.dart';
import 'package:bank_el_ziker/features/home/presentation/cubit/get_random_prayer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerseOfDayCardWidget extends StatelessWidget {
  const VerseOfDayCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRandomPrayerCubit, RequestState<PrayerEntity>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          success: (prayer) => _VerseCard(prayer: prayer),
          failure: (failure) => const _VerseCard(
            prayer: PrayerEntity(
              id: -1,
              content:
                  "ﺭﺑﻨﺎ ﻭﻻ ﺗﺤﻤﻠﻨﺎ ﻣﺎ ﻻ ﻃﺎﻗﺔ ﻟﻨﺎ ﺑﻪ ﻭﺍﻋﻒ ﻋﻨﺎ ﻭﺍﻏﻔﺮ ﻟﻨﺎ ﻭﺍﺭﺣﻤﻨﺎ ﺃﻧﺖ ﻣﻮﻻﻧﺎ ﻓﺎﻧﺼﺮﻧﺎ ﻋﻠﻰ ﺍﻟﻘﻮﻡ ﺍﻟﻜﺎﻓﺮﻳﻦ.",
            ),
          ),
        );
      },
    );
  }
}

class _VerseCard extends StatefulWidget {
  const _VerseCard({required this.prayer});

  final PrayerEntity prayer;

  @override
  State<_VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<_VerseCard> {
  bool _showTranslation = false;

  @override
  void didUpdateWidget(covariant _VerseCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.prayer.id != widget.prayer.id) {
      setState(() => _showTranslation = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final prayer = widget.prayer;
    final isEnglish = Localizations.localeOf(context).languageCode == 'en';
    final hasTranslation = isEnglish &&
        (prayer.transliteration != null || prayer.translation != null);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .color!
                  .withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            prayer.content,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).primaryColor, fontSize: 20),
          ),
          if (hasTranslation) ...[
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () =>
                  setState(() => _showTranslation = !_showTranslation),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _showTranslation
                        ? AppLocalizations.of(context).hideTranslation
                        : AppLocalizations.of(context).showTranslation,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .color!
                          .withValues(alpha: 0.7),
                    ),
                  ),
                  Icon(
                    _showTranslation
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 16,
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .color!
                        .withValues(alpha: 0.7),
                  ),
                ],
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.topCenter,
              child: !_showTranslation
                  ? const SizedBox.shrink()
                  : Column(
                      children: [
                        if (prayer.transliteration != null) ...[
                          const SizedBox(height: 12),
                          Text(
                            prayer.transliteration!,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                        if (prayer.translation != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            prayer.translation!,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .color!
                                  .withValues(alpha: 0.7),
                            ),
                          ),
                        ],
                      ],
                    ),
            ),
          ],
          if (prayer.reference != null) ...[
            const SizedBox(height: 12),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                prayer.reference!,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .color!
                      .withValues(alpha: 0.7),
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () =>
                context.read<GetRandomPrayerCubit>().reExecutePastRequest(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh,
                      size: 16, color: Theme.of(context).primaryColor),
                  const SizedBox(width: 6),
                  Text(
                    AppLocalizations.of(context).anotherVerse,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
