import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_category.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_category_list_item.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_list_search_field.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/adhkar_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/adhkar_progress_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _ZikrCategoryTileSpec {
  const _ZikrCategoryTileSpec(this.category, this.title);
  final String category;
  final String title;
}

const _zikrCategoryTiles = [
  _ZikrCategoryTileSpec('sleep', 'أذكار النوم'),
  _ZikrCategoryTileSpec('wakingUp', 'عند الاستيقاظ'),
  _ZikrCategoryTileSpec('newClothes', 'لبس ثوب جديد'),
  _ZikrCategoryTileSpec('leavingHome', 'الخروج من البيت'),
  _ZikrCategoryTileSpec('enteringBathroom', 'دخول دورة المياة'),
  _ZikrCategoryTileSpec('leavingBathroom', 'الخروج من دورة المياة'),
  _ZikrCategoryTileSpec('enteringMosque', 'دخول المسجد'),
  _ZikrCategoryTileSpec('leavingMosque', 'الخروج من المسجد'),
  _ZikrCategoryTileSpec('hearingAdhan', 'سماع الأذان'),
  _ZikrCategoryTileSpec('afterAdhan', 'بعد سماع الأذان'),
  _ZikrCategoryTileSpec('distress', 'عند الكرب'),
  _ZikrCategoryTileSpec('sadness', 'عند الهَمّ أو الحزن'),
  _ZikrCategoryTileSpec('fearOfPeople', 'عند الخوف من قوم'),
  _ZikrCategoryTileSpec('meetingEnemy', 'عند لقاء العدو'),
  _ZikrCategoryTileSpec('overwhelmed', 'إذا غلبك أمر'),
  _ZikrCategoryTileSpec('afterSin', 'عند فعل ذنب'),
  _ZikrCategoryTileSpec('unpaidDebt', 'من عليه دين عجز عنه'),
  _ZikrCategoryTileSpec('anger', 'عند الغضب'),
  _ZikrCategoryTileSpec('leavingGathering', 'عند القيام من المجلس'),
  _ZikrCategoryTileSpec('seeingAfflicted', 'إذا رأى مبتلى بمرض أو غيره'),
  _ZikrCategoryTileSpec('seeingSomethingPleasing', 'عند رؤية ما يعجبك'),
  _ZikrCategoryTileSpec('leavingHomeDua', 'دعاء الخروج من المنزل'),
  _ZikrCategoryTileSpec('travel', 'دعـاء السفـر'),
  _ZikrCategoryTileSpec('ridingMount', 'دعاء ركوب الدابة'),
  _ZikrCategoryTileSpec('visitingGraves', 'دعاء زيارة القبور'),
];

List<AdhkarCategory> _buildCategories(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  return [
    AdhkarCategory(
      title: l10n.morningAdhkar,
      category: 'morning',
      progressKey: 'morning',
      icon: Icons.wb_sunny_outlined,
      iconBackgroundColor: morningBgLight,
      iconColor: morningOrange,
    ),
    AdhkarCategory(
      title: l10n.eveningAdhkar,
      category: 'evening',
      progressKey: 'evening',
      icon: Icons.nightlight_round,
      iconBackgroundColor: eveningBgLight,
      iconColor: eveningPurple,
    ),
    for (final tile in _zikrCategoryTiles)
      AdhkarCategory(
        title: tile.title,
        category: tile.category,
        progressKey: null,
        icon: Icons.bed_outlined,
        iconBackgroundColor: primaryContainerLight,
        iconColor: primaryGreen,
      ),
    AdhkarCategory(
      title: l10n.afterPrayerAdhkar,
      category: 'afterPrayer',
      progressKey: null,
      icon: Icons.flag_outlined,
      iconBackgroundColor: primaryContainerLight,
      iconColor: primaryGreen,
    ),
    AdhkarCategory(
      title: l10n.ruqyah,
      category: 'ruqyah',
      progressKey: null,
      icon: Icons.shield_outlined,
      iconBackgroundColor: primaryContainerLight,
      iconColor: primaryGreen,
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
                        progress: category.progressKey != null
                            ? progressByCategory[category.progressKey]
                            : null,
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
