import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/constants/initial_data.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_category.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_category_list_item.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_list_search_field.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/reading_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/reading_progress_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<AdhkarCategory> _buildCategories(BuildContext context) {
  final isEnglish = Localizations.localeOf(context).languageCode == 'en';
  return [
    for (final category in InitialData.categories)
      AdhkarCategory(
        title: category.displayTitle(isEnglish),
        category: category.key,
        icon: category.icon,
        iconBackgroundColor: category.color.withValues(alpha: 0.14),
        iconColor: category.color,
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
        child: BlocBuilder<ReadingProgressCubit,
            RequestState<Map<String, ReadingProgressEntity>>>(
          builder: (context, state) {
            final progressByCategory = state.whenOrNull(
                  success: (progress) => progress,
                ) ??
                const <String, ReadingProgressEntity>{};
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
                      AdhkarListSearchField(
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
                        progress: progressByCategory[category.category],
                        onTap: () => AutoRouter.of(context).push(
                          ZikrCategoryRoute(
                            category: category.category,
                            title: category.title,
                          ),
                        ),
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
