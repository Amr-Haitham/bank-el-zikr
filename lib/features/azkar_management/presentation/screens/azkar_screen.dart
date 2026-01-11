import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/screens/sub_screens/adding_new_ziker_popup.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/app_router.dart';
import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/core/presentation/widgets/title_with_back_button.dart';
import 'sub_screens/edit_custom_ziker_popup.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late int selectedZikrId;

  @override
  void initState() {
    // Cubits load data automatically via callOnCreate: true
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateGeneralDataCubit, UpdateGeneralDataState>(
          listener: (context, state) {
            if (state is UpdateGeneralDataUpdated) {
              BlocProvider.of<GetCurrentZikrCubit>(context).getCurrentZikr();
            }
          },
        ),
        BlocListener<AddCustomZikrCubit, AddCustomZikrState>(
          listener: (context, state) {
            if (state is AddCustomZikrLoaded) {
              BlocProvider.of<AzkarCubit>(context).getAllAzkar();
            }
          },
        ),
      ],
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 30, right: 30, left: 30, bottom: 10),
              child: CustomScrollView(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
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
                                  top: Radius.circular(24)),
                            ),
                            builder: (context) {
                              return MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                        value: AppRouter.addCustomZikrCubit),
                                  ],
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: const AddNewZikrPopUp(),
                                  ));
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
                    child: SizedBox(
                      height: 52,
                    ),
                  ),
                  BlocConsumer<GetCurrentZikrCubit, GetCurrentZikrState>(
                    listener: (context, state) {
                      if (state is GetCurrentZikrLoaded) {
                        setState(() {
                          selectedZikrId = state.zikrId;
                        });
                      }
                    },
                    builder: (context, parentState) {
                      if (parentState is GetCurrentZikrLoaded) {
                        return BlocBuilder<AzkarCubit, AzkarState>(
                          builder: (context, state) {
                            if (state is AzkarLoaded) {
                              return SliverList.separated(
                                // physics: const BouncingScrollPhysics(),
                                itemCount: state.azkar.length,
                                itemBuilder: (context, index) {
                                  // listOfAllAzkar.add(state.azkar[index]);
                                  return ListTileOfZikr(
                                    index: index,
                                    onTap: () {
                                      setState(() {
                                        selectedZikrId = state.azkar[index].id;
                                      });
                                      BlocProvider.of<UpdateGeneralDataCubit>(
                                              context)
                                          .updateGeneralDataCurrentZikr(
                                              selectedZikrId);
                                      Navigator.pop(context);
                                    },
                                    zikr: state.azkar[index],
                                    isSelected: (selectedZikrId ==
                                        state.azkar[index].id),
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
                            } else if (state is AzkarError) {
                              return const SliverToBoxAdapter(
                                child: Center(
                                  child: Text("Error"),
                                ),
                              );
                            } else {
                              return const SliverToBoxAdapter(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                        );
                      } else if (parentState is AzkarError) {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: Text("Error"),
                          ),
                        );
                      } else {
                        return const SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class ListTileOfZikr extends StatelessWidget {
  const ListTileOfZikr(
      {super.key,
      required this.zikr,
      required this.onTap,
      required this.index,
      required this.isSelected});
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
                    zikr.isCustomZikr == true
                        ? GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,

                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                // isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24)),
                                ),
                                builder: (context) {
                                  return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      child: MultiBlocProvider(
                                          providers: [
                                            BlocProvider(
                                              create: (context) =>
                                                  UpdateCustomZikrCubit(),
                                            ),
                                            BlocProvider(
                                              create: (context) =>
                                                  DeleteCustomZikrCubit(),
                                            ),
                                            BlocProvider(
                                              create: (context) =>
                                                  DeleteSingleZikrRecordCubit(),
                                            ),
                                            BlocProvider.value(
                                                value: AppRouter
                                                    .updateGeneralDataCubit),
                                            BlocProvider.value(
                                                value: AppRouter.azkarCubit),
                                          ],
                                          child: EditCustomZikerPopup(
                                            isSelected: isSelected,
                                            zikrIndex: index,
                                            zikr: zikr,
                                          )));
                                },
                              );

                              // Navigator.pushNamed(context, editCustomZikrPopup,
                              //     arguments: [isSelected, index, zikr]);
                            },
                            child: Icon(Icons.settings_outlined,
                                color: Theme.of(context).primaryColor))
                        : const SizedBox.shrink(),
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
                                  : appDarkGold),
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
          const SizedBox(
            height: 8,
          ),
          Text(
            zikr.description ?? "",
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: GeneralUtils.isLightTheme(context)
                    ? appGray
                    : appLightGrey),
          ),
        ],
      ),
    );
  }
}
