import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/constants/third_party_values.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_status.dart';
import 'package:bank_el_ziker/features/donations/presentation/cubit/supporter_status_cubit.dart';
import 'package:bank_el_ziker/features/donations/presentation/screens/components/supporter_sheet.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportAppCardWidget extends StatelessWidget {
  const SupportAppCardWidget({super.key});

  Future<void> _openManageSubscription() async {
    final uri = Uri.parse(ThirdPartyValues.manageSubscriptionLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return BlocBuilder<SupporterStatusCubit, RequestState<SupporterStatus>>(
      builder: (context, state) {
        final isSupporter = state.whenOrNull(
              success: (status) => status.isActive,
            ) ??
            false;

        final hasFailed = state is RequestStateFailure<SupporterStatus>;

        return GestureDetector(
          onTap: isSupporter
              ? _openManageSubscription
              : () => SupporterSheet.show(context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(ConstantValues.spacingLg),
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: context.colors.primary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.favorite_rounded,
                    color: context.colors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.supportTheApp,
                        style: context.textTheme.titleMedium!
                            .copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        hasFailed
                            ? localizations.supporterStatusUnavailable
                            : isSupporter
                                ? localizations.supporterActiveLabel
                                : localizations.supportSubtitle,
                        style: context.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                if (!isSupporter)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ConstantValues.spacingLg,
                      vertical: ConstantValues.spacingSm,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      localizations.donate,
                      strutStyle: const StrutStyle(
                        fontSize: 13,
                        height: 1,
                        forceStrutHeight: true,
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                else
                  Text(
                    '💚 ${localizations.manageSubscription}',
                    style: context.textTheme.labelMedium!.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
