import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_category.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_category_list_item.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/adhkar_list_search_field.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/widgets/zikr_category_icon.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/adhkar_progress.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/adhkar_progress_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _ZikrCategoryTileSpec {
  const _ZikrCategoryTileSpec(this.category, this.title, this.titleEn);
  final String category;
  final String title;
  final String titleEn;
}

const _zikrCategoryTiles = [
  _ZikrCategoryTileSpec('sleep', 'أذكار النوم', 'Sleep'),
  _ZikrCategoryTileSpec('wakingUp', 'عند الاستيقاظ', 'Waking Up'),
  _ZikrCategoryTileSpec('newClothes', 'لبس ثوب جديد', 'New Clothes'),
  _ZikrCategoryTileSpec('leavingHome', 'الخروج من البيت', 'Leaving Home'),
  _ZikrCategoryTileSpec(
      'enteringBathroom', 'دخول دورة المياة', 'Entering the Bathroom'),
  _ZikrCategoryTileSpec(
      'leavingBathroom', 'الخروج من دورة المياة', 'Leaving the Bathroom'),
  _ZikrCategoryTileSpec('enteringMosque', 'دخول المسجد', 'Entering the Mosque'),
  _ZikrCategoryTileSpec(
      'leavingMosque', 'الخروج من المسجد', 'Leaving the Mosque'),
  _ZikrCategoryTileSpec('hearingAdhan', 'سماع الأذان', 'Hearing the Adhan'),
  _ZikrCategoryTileSpec('afterAdhan', 'بعد سماع الأذان', 'After the Adhan'),
  _ZikrCategoryTileSpec('distress', 'عند الكرب', 'At Distress'),
  _ZikrCategoryTileSpec('sadness', 'عند الهَمّ أو الحزن', 'Sadness or Grief'),
  _ZikrCategoryTileSpec('fearOfPeople', 'عند الخوف من قوم', 'Fear of People'),
  _ZikrCategoryTileSpec('meetingEnemy', 'عند لقاء العدو', 'Meeting an Enemy'),
  _ZikrCategoryTileSpec('overwhelmed', 'إذا غلبك أمر', 'When Overwhelmed'),
  _ZikrCategoryTileSpec('afterSin', 'عند فعل ذنب', 'After a Sin'),
  _ZikrCategoryTileSpec('unpaidDebt', 'من عليه دين عجز عنه', 'Unpaid Debt'),
  _ZikrCategoryTileSpec('anger', 'عند الغضب', 'Anger'),
  _ZikrCategoryTileSpec(
      'leavingGathering', 'عند القيام من المجلس', 'Leaving a Gathering'),
  _ZikrCategoryTileSpec(
      'seeingAfflicted', 'إذا رأى مبتلى بمرض أو غيره', 'Seeing the Afflicted'),
  _ZikrCategoryTileSpec('seeingSomethingPleasing', 'عند رؤية ما يعجبك',
      'Seeing Something Pleasing'),
  _ZikrCategoryTileSpec(
      'leavingHomeDua', 'دعاء الخروج من المنزل', 'Leaving the House'),
  _ZikrCategoryTileSpec('travel', 'دعـاء السفـر', 'Travel'),
  _ZikrCategoryTileSpec('ridingMount', 'دعاء ركوب الدابة', 'Riding a Mount'),
  _ZikrCategoryTileSpec(
      'visitingGraves', 'دعاء زيارة القبور', 'Visiting Graves'),
];

List<AdhkarCategory> _buildCategories(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  final isEnglish = Localizations.localeOf(context).languageCode == 'en';
  return [
    AdhkarCategory(
      title: l10n.morningAdhkar,
      category: 'morning',
      icon: zikrCategoryIcon('morning'),
      iconBackgroundColor: morningBgLight,
      iconColor: morningOrange,
    ),
    AdhkarCategory(
      title: l10n.eveningAdhkar,
      category: 'evening',
      icon: zikrCategoryIcon('evening'),
      iconBackgroundColor: eveningBgLight,
      iconColor: eveningPurple,
    ),
    for (final tile in _zikrCategoryTiles)
      AdhkarCategory(
        title: isEnglish ? tile.titleEn : tile.title,
        category: tile.category,
        icon: zikrCategoryIcon(tile.category),
        iconBackgroundColor:
            zikrCategoryColor(tile.category).withValues(alpha: 0.14),
        iconColor: zikrCategoryColor(tile.category),
      ),
    AdhkarCategory(
      title: l10n.afterPrayerAdhkar,
      category: 'afterPrayer',
      icon: zikrCategoryIcon('afterPrayer'),
      iconBackgroundColor:
          zikrCategoryColor('afterPrayer').withValues(alpha: 0.14),
      iconColor: zikrCategoryColor('afterPrayer'),
    ),
    AdhkarCategory(
      title: l10n.ruqyah,
      category: 'ruqyah',
      icon: zikrCategoryIcon('ruqyah'),
      iconBackgroundColor: zikrCategoryColor('ruqyah').withValues(alpha: 0.14),
      iconColor: zikrCategoryColor('ruqyah'),
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
