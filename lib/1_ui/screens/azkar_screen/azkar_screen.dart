import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/add_custom_zikr_cubit/add_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_current_zikr/get_current_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
import 'package:bank_el_ziker/app_router.dart';
import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:bank_el_ziker/1_ui/core/consts/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../3_data/models/zikr.dart';
import '../../re-usable widgets/back_button.dart';
import 'components/add_zikr_button.dart';

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
            appBar: AppBar(
              surfaceTintColor: appWhite,
              // backgroundColor: appGreen,
              leading: const CustomBackButton(
                color: appGreen,
              ),
            ),
            body: Stack(
              children: [
                Hero(
                    tag: "azkarScreenButton",
                    child: Container(
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      top: 30.w, right: 30.w, left: 30.w, bottom: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     TextButton.icon(
                      //         onPressed: () {
                      //           Navigator.pop(context);
                      //         },
                      //         icon: Icon(
                      //           Icons.arrow_circle_left_outlined,
                      //           color: appGreen,
                      //           size: 30.sp,
                      //         ),
                      //         style: TextButton.styleFrom(
                      //             padding: const EdgeInsets.all(0)),
                      //         label: Text(
                      //           "رجوع",
                      //           style: cairoTextStyle(
                      //               12.sp, FontWeight.w800, null, appGreen),
                      //         )),
                      //     // Row(
                      //     //   mainAxisAlignment: MainAxisAlignment.center,
                      //     //   crossAxisAlignment: CrossAxisAlignment.center,
                      //     //   children: [
                      //     //     Text(
                      //     //       "إختر الذكر",
                      //     //       style: cairoTextStyle(
                      //     //           9.sp, FontWeight.w800, null, appGreen),
                      //     //     ),
                      //     //     SizedBox(
                      //     //       width: 5.w,
                      //     //     ),
                      //     //     Container(
                      //     //       // padding: EdgeInsets.symmetric(
                      //     //       //     horizontal: 16.w, vertical: 6.sp),
                      //     //       // decoration: BoxDecoration(
                      //     //       //     borderRadius: BorderRadius.circular(11),
                      //     //       //     color: appGreen),
                      //     //       child: Icon(
                      //     //         Icons.menu_book,
                      //     //         color: appGreen,
                      //     //       ),
                      //     //     ),
                      //     //   ],
                      //     // )
                      //   ],
                      // ),
                      const Padding(
                        padding:
                            EdgeInsets.only(right: 15.0, left: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "اختر الذكر",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: appGreen),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.menu_book,
                              size: 35,
                              color: appGreen,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AddNewZikrButton(),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: BlocConsumer<GetCurrentZikrCubit,
                            GetCurrentZikrState>(
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
                                    return ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: state.azkar.length,
                                        itemBuilder: (context, index) {
                                          // listOfAllAzkar.add(state.azkar[index]);
                                          return ListTileOfZikr(
                                            index: index,
                                            onTap: () {
                                              setState(() {
                                                selectedZikrId =
                                                    state.azkar[index].id;
                                              });
                                              BlocProvider.of<
                                                          UpdateGeneralDataCubit>(
                                                      context)
                                                  .updateGeneralDataCurrentZikr(
                                                      selectedZikrId);
                                            },
                                            zikr: state.azkar[index],
                                            isSelected: (selectedZikrId ==
                                                state.azkar[index].id),
                                          );
                                        });
                                  } else if (state is AzkarError) {
                                    return const Center(
                                      child: Text("Error"),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              );
                            } else if (parentState is AzkarError) {
                              return const Center(
                                child: Text("Error"),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: ListTile(
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
                    color: isSelected ? appGreen : appDarkTextColor,
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
                                Navigator.pushNamed(
                                    context, editCustomZikrScreen,
                                    arguments: [isSelected, index, zikr]);
                              },
                              child: const Icon(Icons.edit_note))
                          : const SizedBox.shrink(),
                      Expanded(
                        child: AutoSizeText(
                          zikr.content,
                          textDirection: TextDirection.rtl,
                          style: cairoTextStyle(
                              20.sp, FontWeight.w800, 1.25, appGreen),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0.w),
                        child: Image.asset(
                          "assets/images/zikr_arrow.png",
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              zikr.description ?? "",
              textDirection: TextDirection.rtl,
              style:
                  cairoTextStyle(15, FontWeight.w600, null, appDarkTextColor),
            )
          ],
        ),
      ),
    );
  }
}
