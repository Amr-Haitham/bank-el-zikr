import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/1_ui/screens/azkar_screen/sub_screens/adding_new_ziker_popup.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/add_custom_zikr_cubit/add_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_current_zikr/get_current_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:bank_el_ziker/4_utility_functions/screen_utils.dart';
import 'package:bank_el_ziker/app_router.dart';
import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:bank_el_ziker/1_ui/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../2_state_management/azkar_records/delete_single_zikr_record/delete_single_zikr_record_cubit.dart';
import '../../../2_state_management/custom_azkar_cubits/delete_custom_zikr_cubit/delete_custom_zikr_cubit.dart';
import '../../../2_state_management/custom_azkar_cubits/update_custom_zikr/update_custom_zikr_cubit.dart';
import '../../../3_data/models/zikr.dart';
import '../../re-usable widgets/title_with_back_button.dart';
import '../../../5_old_code/add_zikr_button.dart';
import 'sub_screens/edit_custom_ziker_popup.dart';

// List<Zikr> listOfAllAzkar = [];

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late int selectedZikrId;

  @override
  void initState() {
    BlocProvider.of<GetCurrentZikrCubit>(context).getCurrentZikr();
    BlocProvider.of<AzkarCubit>(context).getAllAzkar();

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
            backgroundColor: appWhite,
            body: Padding(
              padding: EdgeInsets.only(
                  top: 30.w, right: 30.w, left: 30.w, bottom: 10.h),
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
                            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24)),
                            ),
                            builder: (context) {
                              return MultiBlocProvider(providers: [
                                BlocProvider.value(
                                    value: AppRouter.addCustomZikrCubit),
                              ], child: const AddNewZikrPopUp());
                            },
                          );
                        },
                        style: IconButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16.0.w),
                child: Image.asset(
                  isSelected
                      ? "assets/images/checked.png"
                      : "assets/images/unchecked.png",
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : appDarkTextColor,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    zikr.isCustomZikr == true
                        ? GestureDetector(
                            onTap: () {
                              
                              showModalBottomSheet(
                                context: context,backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                isScrollControlled: true,
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
                                                value: AppRouter.updateGeneralDataCubit),
                                            BlocProvider.value(
                                                value: AppRouter.azkarCubit),
                                          ],
                                          child: EditCustomZikerPopup(
                                            isSelected:
                                               isSelected,
                                            zikrIndex:
                                               index,
                                            zikr:
                                                zikr,
                                          )));
                                },
                              );

                              // Navigator.pushNamed(context, editCustomZikrPopup,
                              //     arguments: [isSelected, index, zikr]);
                            },
                            child:  Icon(Icons.settings_outlined,color: Theme.of(context).primaryColor))
                        : const SizedBox.shrink(),
                    Expanded(
                      child: AutoSizeText(
                        zikr.content,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0.w),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
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
            style: cairoTextStyle(15, FontWeight.w600, null, appDarkTextColor),
          ),
        ],
      ),
    );
  }
}
