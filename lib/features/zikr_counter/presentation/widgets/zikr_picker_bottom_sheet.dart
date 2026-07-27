import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/add_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/widgets/list_tile_of_zikr.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/widgets/add_custom_zikr_popup.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Lightweight in-place list for switching the active tasbih zikr, shown
/// as a bottom sheet instead of pushing the full Azkar library screen.
class ZikrPickerBottomSheet extends StatelessWidget {
  const ZikrPickerBottomSheet({super.key, required this.currentZikrId});

  final int currentZikrId;

  static Future<void> show(BuildContext context, {required int currentZikrId}) {
    // showModalBottomSheet mounts its content as a sibling overlay entry,
    // not a descendant of the calling route's widget tree — so cubits that
    // are only provided locally within that route (like GetAllAzkarCubit,
    // provided by TasbeehWerdPage) must be captured and re-provided here
    // explicitly, or lookups inside the sheet throw immediately on open.
    final azkarCubit = context.read<GetAllAzkarCubit>();
    final counterCubit = context.read<CounterCubit>();

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: azkarCubit),
          BlocProvider.value(value: counterCubit),
          // ListTileOfZikr's edit-popup path (custom zikr settings icon)
          // reads these too — provide them so it doesn't crash if tapped.
          BlocProvider(create: (_) => getService<UpdateCustomZikrCubit>()),
          BlocProvider(create: (_) => getService<DeleteCustomZikrCubit>()),
          BlocProvider(create: (_) => getService<AddCustomZikrCubit>()),
        ],
        child: ZikrPickerBottomSheet(currentZikrId: currentZikrId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddCustomZikrCubit, RequestState<void>>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) => context.read<GetAllAzkarCubit>().loadAzkar(),
              failure: (f) => context.showErrorNotification(
                message: f.getRunModeDependentMessage(context),
              ),
            );
          },
        ),
        BlocListener<DeleteCustomZikrCubit, RequestState<void>>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) => context.read<GetAllAzkarCubit>().loadAzkar(),
              failure: (f) => context.showErrorNotification(
                message: f.getRunModeDependentMessage(context),
              ),
            );
          },
        ),
      ],
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return Builder(builder: (context) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 4, right: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .color!
                            .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Builder(builder: (context) {
                      final isEnglish =
                          Localizations.localeOf(context).languageCode == 'en';
                      final closeButton = Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).maybePop(),
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      );
                      final title = Text(
                        AppLocalizations.of(context).chooseZikr,
                        style: Theme.of(context).textTheme.headlineSmall,
                      );
                      final addZikrButton = Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () => AddCustomZikrPopup.show(context),
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: isEnglish
                            ? [addZikrButton, title, closeButton]
                            : [closeButton, title, addZikrButton],
                      );
                    }),
                    const SizedBox(height: 12),
                    Expanded(
                      child: BlocBuilder<GetAllAzkarCubit,
                          RequestState<List<ZikrEntity>>>(
                        builder: (context, azkarState) {
                          return azkarState.when(
                            initial: () => const SizedBox.shrink(),
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            failure: (f) => const SizedBox.shrink(),
                            success: (azkar) {
                              return ScrollbarTheme(
                                data: const ScrollbarThemeData(
                                  crossAxisMargin: 4,
                                ),
                                child: Scrollbar(
                                  controller: scrollController,
                                  thumbVisibility: true,
                                  radius: const Radius.circular(10),
                                  thickness: 8,
                                  child: ListView(
                                    controller: scrollController,
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 14),
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surfaceContainerHighest
                                              .withValues(alpha: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            for (final zikr in azkar) ...[
                                              ListTileOfZikr(
                                                zikr: zikr,
                                                isSelected:
                                                    zikr.id == currentZikrId,
                                                useGreenCheckIndicator: true,
                                                onDeleteCustomZikr: zikr
                                                        .isCustomZikr
                                                    ? () => context
                                                        .read<
                                                            DeleteCustomZikrCubit>()
                                                        .deleteZikr(zikr.id)
                                                    : null,
                                                onTap: () {
                                                  context
                                                      .read<CounterCubit>()
                                                      .setCurrentZikr(zikr.id);
                                                  Navigator.of(context)
                                                      .maybePop();
                                                },
                                              ),
                                              if (zikr != azkar.last) ...[
                                                const SizedBox(height: 16),
                                                Divider(
                                                  height: 1,
                                                  thickness: 1,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .outline,
                                                ),
                                                const SizedBox(height: 16),
                                              ],
                                            ],
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
