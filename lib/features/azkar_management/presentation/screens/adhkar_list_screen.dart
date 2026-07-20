import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/widgets/adhkar_category.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/widgets/adhkar_category_list_item.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/adhkar_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/adhkar_progress_cubit.dart';
import 'package:bank_el_ziker/features/situational_azkar/presentation/widgets/situational_zikr_search_widget.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<AdhkarCategory> _buildCategories(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return [
    AdhkarCategory(
      title: l10n.morningAdhkar,
      progressKey: "morning",
      icon: Icons.wb_sunny_outlined,
      iconBackgroundColor: const Color(0xffFFE7CF),
      iconColor: const Color(0xffFF9F43),
      onTap: () => AutoRouter.of(context).push(const MorningAzkarRoute()),
    ),
    AdhkarCategory(
      title: l10n.eveningAdhkar,
      progressKey: "evening",
      icon: Icons.nightlight_round,
      iconBackgroundColor: const Color(0xffE3E1FB),
      iconColor: const Color(0xff5E5CE6),
      onTap: () => AutoRouter.of(context).push(const NightAzkarRoute()),
    ),
    AdhkarCategory(
      title: l10n.sleepAdhkar,
      progressKey: null,
      icon: Icons.bed_outlined,
      iconBackgroundColor: const Color(0xffDCF5E0),
      iconColor: const Color(0xff34C759),
      onTap: () => AutoRouter.of(context).push(const SituationsAzkarRoute()),
    ),
    AdhkarCategory(
      title: l10n.afterPrayerAdhkar,
      progressKey: null,
      icon: Icons.flag_outlined,
      iconBackgroundColor: const Color(0xffDCF5E0),
      iconColor: const Color(0xff34C759),
      onTap: () => AutoRouter.of(context).push(const SituationsAzkarRoute()),
    ),
    AdhkarCategory(
      title: l10n.ruqyah,
      progressKey: null,
      icon: Icons.shield_outlined,
      iconBackgroundColor: const Color(0xffDCF5E0),
      iconColor: const Color(0xff34C759),
      onTap: () => AutoRouter.of(context).push(const SituationsAzkarRoute()),
    ),
  ];
}

class AdhkarListScreen extends StatefulWidget {
  const AdhkarListScreen({super.key});

  @override
  State<AdhkarListScreen> createState() => _AdhkarListScreenState();
}

class _AdhkarListScreenState extends State<AdhkarListScreen> {
  String _query = "";

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = _buildCategories(context);
    final filtered = categories
        .where((c) => c.title.toLowerCase().contains(_query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child:
            BlocBuilder<AdhkarProgressCubit, Map<String, AdhkarProgressEntity>>(
          builder: (context, progressByCategory) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantValues.appHorizontalPadding),
                  sliver: SliverList.list(
                    children: [
                      const SizedBox(height: ConstantValues.appTopPadding),
                      Text(
                        l10n.adhkarList,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 24),
                      ),
                      const SizedBox(height: 22),
                      SituationalZikrSearchWidget(
                        hintText: l10n.searchAdhkar,
                        onChanged: (value) => setState(() => _query = value),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantValues.appHorizontalPadding),
                  sliver: SliverList.separated(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      final category = filtered[index];
                      return AdhkarCategoryListItem(
                        category: category,
                        progress: category.progressKey != null
                            ? progressByCategory[category.progressKey]
                            : null,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: ConstantValues.appBottomPadding),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
