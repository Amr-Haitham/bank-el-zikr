import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/custom_app_button.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_pricing.dart';
import 'package:bank_el_ziker/features/donations/domain/entities/supporter_status.dart';
import 'package:bank_el_ziker/features/donations/presentation/cubit/supporter_pricing_cubit.dart';
import 'package:bank_el_ziker/features/donations/presentation/cubit/supporter_status_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SupporterSheet extends StatelessWidget {
  const SupporterSheet({super.key});

  static Future<void> show(BuildContext context) {
    final statusCubit = context.read<SupporterStatusCubit>();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: statusCubit),
          BlocProvider(create: (_) => getService<SupporterPricingCubit>()),
        ],
        child: const SupporterSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child:
              BlocConsumer<SupporterStatusCubit, RequestState<SupporterStatus>>(
            listener: (context, state) {
              state.whenOrNull(
                failure: (failure) => context.showErrorNotification(
                  message: failure.getDisplayMessage(context),
                ),
                success: (status) {
                  if (status.isActive) {
                    Navigator.of(context).pop();
                  }
                },
              );
            },
            builder: (context, state) {
              final isLoading = state is RequestStateLoading;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: context.colors.outline,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: context.colors.primary.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_rounded,
                        color: context.colors.primary,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    localizations.supporterSheetTitle,
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: context.colors.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      localizations.supporterSheetBody,
                      style: context.textTheme.bodyMedium!.copyWith(
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 24),
                  BlocBuilder<SupporterPricingCubit,
                      RequestState<SupporterPricing>>(
                    builder: (context, pricingState) {
                      final packages = pricingState.whenOrNull(
                            success: (pricing) => pricing.packages,
                          ) ??
                          const [];

                      if (packages.isEmpty) {
                        return CustomAppButton(
                          onPressed: () {},
                          text: localizations.subscribeAction,
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (final package in packages) ...[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (package.description.isNotEmpty)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        package.description,
                                        style: context.textTheme.bodySmall,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  CustomAppButton(
                                    onPressed: isLoading
                                        ? () {}
                                        : () => context
                                            .read<SupporterStatusCubit>()
                                            .subscribe(package.identifier),
                                    text: isLoading
                                        ? ''
                                        : '${package.title} — '
                                            '${package.priceString}',
                                    trailing: isLoading
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.white,
                                            ),
                                          )
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 4),
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () => context
                            .read<SupporterStatusCubit>()
                            .restorePurchases(),
                    child: Text(
                      localizations.restorePurchases,
                      style: context.textTheme.labelMedium!
                          .copyWith(color: context.colors.primary),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
