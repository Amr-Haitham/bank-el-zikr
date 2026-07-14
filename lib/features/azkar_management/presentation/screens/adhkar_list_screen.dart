import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/widgets/adhkar_category_card.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/adhkar_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/adhkar_progress_cubit.dart';
import 'package:bank_el_ziker/features/situational_azkar/presentation/widgets/situational_zikr_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _AdhkarCategory {
  final String title;

  /// Key into the real progress map (from AdhkarProgressCubit), or null
  /// when this category isn't tracked yet (no dedicated data/screen exists).
  final String? progressKey;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final VoidCallback Function(BuildContext context) onTapBuilder;

  const _AdhkarCategory({
    required this.title,
    required this.progressKey,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.onTapBuilder,
  });
}

class AdhkarListScreen extends StatefulWidget {
  const AdhkarListScreen({super.key});

  @override
  State<AdhkarListScreen> createState() => _AdhkarListScreenState();
}

class _AdhkarListScreenState extends State<AdhkarListScreen> {
  String _query = "";

  static final List<_AdhkarCategory> _categories = [
    _AdhkarCategory(
      title: "Morning Adhkar",
      progressKey: "morning",
      icon: Icons.wb_sunny_outlined,
      iconBackgroundColor: const Color(0xffFFE7CF),
      iconColor: const Color(0xffFF9F43),
      onTapBuilder: (context) =>
          () => AutoRouter.of(context).push(const MorningAzkarRoute()),
    ),
    _AdhkarCategory(
      title: "Evening Adhkar",
      progressKey: "evening",
      icon: Icons.nightlight_round,
      iconBackgroundColor: const Color(0xffE3E1FB),
      iconColor: const Color(0xff5E5CE6),
      onTapBuilder: (context) =>
          () => AutoRouter.of(context).push(const NightAzkarRoute()),
    ),
    _AdhkarCategory(
      title: "Sleep Adhkar",
      progressKey: null,
      icon: Icons.bed_outlined,
      iconBackgroundColor: const Color(0xffDCF5E0),
      iconColor: const Color(0xff34C759),
      onTapBuilder: (context) =>
          () => AutoRouter.of(context).push(const SituationsAzkarRoute()),
    ),
    _AdhkarCategory(
      title: "After-Prayer Adhkar",
      progressKey: null,
      icon: Icons.flag_outlined,
      iconBackgroundColor: const Color(0xffDCF5E0),
      iconColor: const Color(0xff34C759),
      onTapBuilder: (context) =>
          () => AutoRouter.of(context).push(const SituationsAzkarRoute()),
    ),
    _AdhkarCategory(
      title: "Ruqyah",
      progressKey: null,
      icon: Icons.shield_outlined,
      iconBackgroundColor: const Color(0xffDCF5E0),
      iconColor: const Color(0xff34C759),
      onTapBuilder: (context) =>
          () => AutoRouter.of(context).push(const SituationsAzkarRoute()),
    ),
  ];

  String _formatLastRead(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);
    if (diff.inMinutes < 60) {
      return diff.inMinutes <= 1 ? "Just now" : "${diff.inMinutes}m ago";
    }
    if (diff.inHours < 24 &&
        dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return "${diff.inHours}h ago";
    }
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? "PM" : "AM";
    final yesterday = now.subtract(const Duration(days: 1));
    final isYesterday = dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day;
    if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return "Today, $hour:$minute $period";
    }
    if (isYesterday) {
      return "Yesterday, $hour:$minute $period";
    }
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _categories
        .where((c) => c.title.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocBuilder<AdhkarProgressCubit,
            Map<String, AdhkarProgressEntity>>(
          builder: (context, progressByCategory) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantValues.appHorizontalPadding),
              children: [
                const SizedBox(height: ConstantValues.appTopPadding),
                Text(
                  "Adhkar List",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 24),
                ),
                const SizedBox(height: 22),
                SituationalZikrSearchWidget(
                  hintText: "Search adhkar...",
                  onChanged: (value) => setState(() => _query = value),
                ),
                const SizedBox(height: 20),
                for (final category in filtered) ...[
                  Builder(builder: (context) {
                    final progress = category.progressKey != null
                        ? progressByCategory[category.progressKey]
                        : null;

                    final String subtitle;
                    if (category.progressKey == null) {
                      subtitle = "Not tracked yet";
                    } else if (progress?.lastReadAt == null) {
                      subtitle = "Status: Not started";
                    } else {
                      subtitle =
                          "Last read: ${_formatLastRead(progress!.lastReadAt!)}";
                    }

                    return AdhkarCategoryCard(
                      title: category.title,
                      subtitle: subtitle,
                      icon: category.icon,
                      iconBackgroundColor: category.iconBackgroundColor,
                      iconColor: category.iconColor,
                      progress: progress != null && progress.totalCount > 0
                          ? progress.progress
                          : null,
                      isCompleted: progress?.isCompleted ?? false,
                      onTap: category.onTapBuilder(context),
                    );
                  }),
                  const SizedBox(height: 16),
                ],
                const SizedBox(height: ConstantValues.appBottomPadding),
              ],
            );
          },
        ),
      ),
    );
  }
}
