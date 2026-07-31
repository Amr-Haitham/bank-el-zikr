import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_category.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_category_card.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/adhkar_progress.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

/// Resolves a single [AdhkarCategory] against the live progress map and
/// renders it as an [AdhkarCategoryCard]. Kept separate from the card itself
/// so the subtitle/progress-resolution logic can be fed new data sources
/// later without touching the card's rendering.
class AdhkarCategoryListItem extends StatelessWidget {
  const AdhkarCategoryListItem({
    super.key,
    required this.category,
    required this.progress,
    required this.onTap,
  });

  final AdhkarCategory category;
  final AdhkarProgressEntity? progress;
  final VoidCallback onTap;

  static String formatLastRead(BuildContext context, DateTime dateTime) {
    final l10n = AppLocalizations.of(context);
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inMinutes < 60) {
      return diff.inMinutes <= 1
          ? l10n.justNow
          : l10n.minutesAgo(diff.inMinutes);
    }
    if (diff.inHours < 24 &&
        dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return l10n.hoursAgo(diff.inHours);
    }
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? l10n.pm : l10n.am;
    final time = "$hour:$minute $period";
    final yesterday = now.subtract(const Duration(days: 1));
    final isYesterday = dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day;
    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return l10n.today(time);
    }
    if (isYesterday) {
      return l10n.yesterday(time);
    }
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final String subtitle = progress?.lastReadAt == null
        ? l10n.statusNotStarted
        : l10n.lastRead(formatLastRead(context, progress!.lastReadAt!));

    return AdhkarCategoryCard(
      title: category.title,
      subtitle: subtitle,
      icon: category.icon,
      iconBackgroundColor: category.iconBackgroundColor,
      iconColor: category.iconColor,
      progress: progress?.progress ?? 0.0,
      onTap: onTap,
    );
  }
}
