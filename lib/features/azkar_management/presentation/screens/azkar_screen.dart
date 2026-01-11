import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/core/presentation/widgets/title_with_back_button.dart';
import 'sub_screens/adding_new_ziker_popup.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 30, right: 30, left: 30, bottom: 10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: TitleWithBackButton(
                  trailing: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(24),
                          ),
                        ),
                        builder: (dialogContext) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(dialogContext)
                                  .viewInsets
                                  .bottom,
                            ),
                            child: BlocProvider.value(
                              value: context.read<AzkarCubit>(),
                              child: const AddNewZikrPopUp(),
                            ),
                          );
                        },
                      );
                    },
                    style: IconButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    icon: Icon(
                      Icons.add,
                      color: GeneralUtils.isLightTheme(context)
                          ? appWhite
                          : appDark,
                    ),
                  ),
                  title: "اختر الذكر",
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 52),
              ),
              // Main content: Counter state + Azkar list
              BlocBuilder<CounterCubit, RequestState<CounterState>>(
                builder: (context, counterState) {
                  return counterState.when(
                    initial: () => const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    loading: () => const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    success: (counter) {
                      final selectedZikrId = counter.currentZikrId;

                      return BlocBuilder<AzkarCubit, RequestState<List<Zikr>>>(
                        builder: (context, azkarState) {
                          return azkarState.when(
                            initial: () => const SliverToBoxAdapter(
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            loading: () => const SliverToBoxAdapter(
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            success: (azkar) {
                              return SliverList.separated(
                                itemCount: azkar.length,
                                itemBuilder: (context, index) {
                                  return ListTileOfZikr(
                                    index: index,
                                    onTap: () {
                                      context
                                          .read<CounterCubit>()
                                          .setCurrentZikr(azkar[index].id);
                                      Navigator.pop(context);
                                    },
                                    zikr: azkar[index],
                                    isSelected:
                                        (selectedZikrId == azkar[index].id),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider(
                                    height: 64,
                                    indent: 44,
                                    endIndent: 44,
                                  );
                                },
                              );
                            },
                            failure: (failure) => const SliverToBoxAdapter(
                              child: Center(
                                child: Text("Error loading azkar"),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    failure: (failure) => const SliverToBoxAdapter(
                      child: Center(
                        child: Text("Error loading counter state"),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileOfZikr extends StatelessWidget {
  const ListTileOfZikr({
    super.key,
    required this.zikr,
    required this.onTap,
    required this.index,
    required this.isSelected,
  });

  final bool isSelected;
  final Zikr zikr;
  final int index;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Settings icon for custom zikr
                    if (zikr.isCustomZikr == true)
                      GestureDetector(
                        onTap: () {
                          // TODO: Implement edit custom zikr dialog
                          // Will need to create a new version of EditCustomZikerPopup
                          // that uses AzkarCubit.updateZikr() and AzkarCubit.deleteZikr()
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      )
                    else
                      const SizedBox.shrink(),
                    Expanded(
                      child: AutoSizeText(
                        zikr.content,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: GeneralUtils.isLightTheme(context)
                                ? appLightGold
                                : appDarkGold,
                          ),
                          color: isSelected
                              ? (GeneralUtils.isLightTheme(context)
                                  ? appLightGold
                                  : appDarkGold)
                              : Colors.transparent,
                        ),
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            zikr.description ?? "",
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: GeneralUtils.isLightTheme(context)
                      ? appGray
                      : appLightGrey,
                ),
          ),
        ],
      ),
    );
  }
}
