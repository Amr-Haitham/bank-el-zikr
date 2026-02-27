import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/presentation/cubit/morning_night_azkar_cubit.dart';
import 'package:bank_el_ziker/features/situational_azkar/presentation/cubit/situational_azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum _AzkarFilter { all, basic, favorites, prayer }

class AzkarListScreen extends StatefulWidget {
  const AzkarListScreen({super.key});

  @override
  State<AzkarListScreen> createState() => _AzkarListScreenState();
}

class _AzkarListScreenState extends State<AzkarListScreen> {
  _AzkarFilter _activeFilter = _AzkarFilter.all;

  @override
  void initState() {
    super.initState();
    context.read<MorningNightAzkarCubit>().loadMorningAzkar();
    context.read<SituationalAzkarCubit>().loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            // ── Header ─────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: ConstantValues.appHorizontalPadding,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Filter icon
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(Icons.tune_rounded,
                          color: primaryColor, size: 20),
                    ),
                    Text(
                      'قائمة الأذكار',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    // Back button
                    GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(Icons.arrow_forward,
                            color: Colors.grey[700], size: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ── Filter chips ────────────────────────────────────────
            SliverToBoxAdapter(
              child: SizedBox(
                height: 44,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: ConstantValues.appHorizontalPadding),
                    children: [
                      _FilterChip(
                        label: 'الكل',
                        isActive: _activeFilter == _AzkarFilter.all,
                        onTap: () =>
                            setState(() => _activeFilter = _AzkarFilter.all),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'الأساسية',
                        isActive: _activeFilter == _AzkarFilter.basic,
                        onTap: () =>
                            setState(() => _activeFilter = _AzkarFilter.basic),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'المفضلة',
                        isActive: _activeFilter == _AzkarFilter.favorites,
                        onTap: () => setState(
                            () => _activeFilter = _AzkarFilter.favorites),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'أذكار الصلاة',
                        isActive: _activeFilter == _AzkarFilter.prayer,
                        onTap: () =>
                            setState(() => _activeFilter = _AzkarFilter.prayer),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // ── Azkar cards ─────────────────────────────────────────
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                  horizontal: ConstantValues.appHorizontalPadding),
              sliver: _buildAzkarList(),
            ),

            const SliverToBoxAdapter(
                child: SizedBox(height: ConstantValues.appBottomPadding)),
          ],
        ),
      ),
    );
  }

  Widget _buildAzkarList() {
    // Morning & night azkar (basic)
    if (_activeFilter == _AzkarFilter.basic ||
        _activeFilter == _AzkarFilter.all) {
      return _buildMorningNightSection();
    }

    if (_activeFilter == _AzkarFilter.prayer) {
      return _buildSituationalSection();
    }

    if (_activeFilter == _AzkarFilter.favorites) {
      return _buildFavoritesSection();
    }

    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }

  Widget _buildMorningNightSection() {
    return BlocBuilder<MorningNightAzkarCubit,
        RequestState<List<MorningNightZikrEntity>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          success: (azkar) {
            final morningItems = [
              _AzkarGroupCard(
                title: 'أذكار الصباح',
                subtitle: 'تمت قراءة ${azkar.length ~/ 2} من ${azkar.length} ذكراً',
                icon: Icons.wb_sunny_outlined,
                iconBgColor: const Color(0xFFFFF3E0),
                iconColor: const Color(0xFFFF9500),
                previewText: azkar.isNotEmpty
                    ? '"${azkar.first.content.substring(0, azkar.first.content.length.clamp(0, 60))}..."'
                    : '',
                progress: 0.6,
                isCompleted: false,
                onTap: () =>
                    AutoRouter.of(context).push(const MorningAzkarRoute()),
              ),
              const SizedBox(height: 12),
              _AzkarGroupCard(
                title: 'أذكار المساء',
                subtitle: 'لم تبدأ بعد',
                icon: Icons.nightlight_round,
                iconBgColor: const Color(0xFFEEEEFF),
                iconColor: const Color(0xFF5856D6),
                previewText: azkar.length > 1
                    ? '"${azkar.last.content.substring(0, azkar.last.content.length.clamp(0, 60))}..."'
                    : '',
                progress: 0.0,
                isCompleted: false,
                onTap: () =>
                    AutoRouter.of(context).push(const NightAzkarRoute()),
              ),
              const SizedBox(height: 12),
              if (_activeFilter == _AzkarFilter.all)
                _AzkarGroupCard(
                  title: 'أذكار بعد الصلاة',
                  subtitle: 'مكتملة تماماً',
                  icon: Icons.sign_language_outlined,
                  iconBgColor: const Color(0xFFE8F5E9),
                  iconColor: Theme.of(context).primaryColor,
                  previewText:
                      '"عوض لما قد يحدث من نقص في الصلاة واستجابة للدعاء"',
                  progress: 1.0,
                  isCompleted: true,
                  onTap: () => AutoRouter.of(context)
                      .push(const SituationsAzkarRoute()),
                ),
              if (_activeFilter == _AzkarFilter.all)
                const SizedBox(height: 12),
              if (_activeFilter == _AzkarFilter.all)
                _AzkarGroupCard(
                  title: 'أذكار النوم',
                  subtitle: 'لم تبدأ بعد',
                  icon: Icons.bedtime_outlined,
                  iconBgColor: const Color(0xFFEEEEFF),
                  iconColor: const Color(0xFF5856D6),
                  previewText: '"اللهم باسمك أموت وأحيا"',
                  progress: 0.0,
                  isCompleted: false,
                  onTap: () =>
                      AutoRouter.of(context).push(const NightAzkarRoute()),
                ),
            ];

            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => morningItems[index],
                childCount: morningItems.length,
              ),
            );
          },
          failure: (_) => const SliverToBoxAdapter(
            child: Center(child: Text('حدث خطأ في تحميل الأذكار')),
          ),
        );
      },
    );
  }

  Widget _buildSituationalSection() {
    return BlocBuilder<SituationalAzkarCubit, RequestState<List<ZikrEntity>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          success: (azkar) {
            return SliverList.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: azkar.length,
              itemBuilder: (context, index) {
                final zikr = azkar[index];
                return _SituationalZikrCard(
                  zikr: zikr,
                  onTap: () =>
                      AutoRouter.of(context).push(ZikrContentRoute(zikr: zikr)),
                );
              },
            );
          },
          failure: (_) => const SliverToBoxAdapter(
            child: Center(child: Text('حدث خطأ في تحميل الأذكار')),
          ),
        );
      },
    );
  }

  Widget _buildFavoritesSection() {
    return BlocBuilder<SituationalAzkarCubit, RequestState<List<ZikrEntity>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          success: (azkar) {
            final cubit = context.read<SituationalAzkarCubit>();
            final favorites =
                azkar.where((z) => cubit.isFavorite(z.id)).toList();
            if (favorites.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(child: Text('لا يوجد أذكار في المفضلة')),
              );
            }
            return SliverList.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final zikr = favorites[index];
                return _SituationalZikrCard(
                  zikr: zikr,
                  onTap: () =>
                      AutoRouter.of(context).push(ZikrContentRoute(zikr: zikr)),
                );
              },
            );
          },
          failure: (_) => const SliverToBoxAdapter(
            child: Center(child: Text('حدث خطأ في تحميل الأذكار')),
          ),
        );
      },
    );
  }
}

// ── Filter chip ──────────────────────────────────────────────────────────────

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey[700],
            fontSize: 13,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ── Group card (morning / evening / prayer) ──────────────────────────────────

class _AzkarGroupCard extends StatelessWidget {
  const _AzkarGroupCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.previewText,
    required this.progress,
    required this.isCompleted,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String previewText;
  final double progress;
  final bool isCompleted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Top row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left: chevron + completion badge
                Row(
                  children: [
                    Icon(Icons.chevron_left,
                        color: Colors.grey[400], size: 20),
                    if (isCompleted) ...[
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .primaryColor
                              .withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'مكتملة تماماً',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                // Right: icon + title
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: isCompleted
                                ? Theme.of(context).primaryColor
                                : Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: iconColor, size: 24),
                    ),
                  ],
                ),
              ],
            ),
            // Preview text
            if (previewText.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                previewText,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey[500],
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
              ),
            ],
            const SizedBox(height: 12),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                backgroundColor: const Color(0xFFEEEEF3),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Situational zikr card ────────────────────────────────────────────────────

class _SituationalZikrCard extends StatelessWidget {
  const _SituationalZikrCard({required this.zikr, required this.onTap});
  final ZikrEntity zikr;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.chevron_left, color: Colors.grey[400], size: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    zikr.title ?? zikr.content,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (zikr.description != null &&
                      zikr.description!.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      zikr.description!,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFEEEEF3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.format_quote_rounded,
                color: Theme.of(context).primaryColor,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
