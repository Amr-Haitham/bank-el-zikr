import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/directional_chevron.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/day_record.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/day_record_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdhkarStatusRowWidget extends StatelessWidget {
  const AdhkarStatusRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final incompleteColor =
        context.textTheme.bodySmall!.color!.withValues(alpha: 0.5);

    return BlocBuilder<DayRecordCubit, RequestState<List<DayRecordEntity>>>(
      builder: (context, state) {
        final today = state.whenOrNull(
          success: (records) =>
              records.where((record) => record.isToday).firstOrNull,
        );
        final morningDone = today?.morningCompleted ?? false;
        final eveningDone = today?.eveningCompleted ?? false;

        return Row(
          children: [
            Expanded(
              child: _AdhkarStatusCard(
                icon: Icons.wb_sunny_outlined,
                iconColor: morningOrange,
                title: l10n.morningAdhkar,
                status: morningDone ? l10n.done : l10n.incomplete,
                statusColor:
                    morningDone ? context.theme.primaryColor : incompleteColor,
                isDone: morningDone,
                onTap: () => AutoRouter.of(context).push(ZikrCategoryRoute(
                    category: 'morning', title: l10n.morningAdhkar)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _AdhkarStatusCard(
                icon: Icons.nightlight_round,
                iconColor: eveningPurple,
                title: l10n.eveningAdhkar,
                status: eveningDone ? l10n.done : l10n.incomplete,
                statusColor:
                    eveningDone ? context.theme.primaryColor : incompleteColor,
                isDone: eveningDone,
                onTap: () => AutoRouter.of(context).push(ZikrCategoryRoute(
                    category: 'evening', title: l10n.eveningAdhkar)),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AdhkarStatusCard extends StatelessWidget {
  const _AdhkarStatusCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.status,
    required this.statusColor,
    required this.isDone,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String status;
  final Color statusColor;
  final bool isDone;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: context.textTheme.bodyMedium!
                  .copyWith(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
                isDone
                    ? Icon(Icons.check_circle_rounded,
                        size: 18, color: context.theme.primaryColor)
                    : DirectionalChevron(
                        size: 18,
                        color: context.textTheme.bodySmall!.color!
                            .withValues(alpha: 0.4)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
