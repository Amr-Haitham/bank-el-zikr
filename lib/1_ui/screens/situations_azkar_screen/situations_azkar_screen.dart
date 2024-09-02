import 'package:bank_el_ziker/1_ui/screens/situations_azkar_screen/components/situational_zikr_list_tile.dart';
import 'package:bank_el_ziker/2_state_management/situational_azkar_cubits/add_or_remove_situational_azkar/handle_fav_situational_azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../2_state_management/situational_azkar_cubits/get_conditional_azkar_cubit/get_conditional_azkar_cubit.dart';
import '../../../3_data/models/zikr.dart';
import '../../../app_router.dart';
import '../../core/consts/constant_values.dart';
import '../../re-usable widgets/title_with_back_button.dart';
import 'components/situational_zikr_search_widget.dart';

class SituationsAzkarScreen extends StatefulWidget {
  const SituationsAzkarScreen({super.key});

  @override
  State<SituationsAzkarScreen> createState() => _SituationsAzkarScreenState();
}

class _SituationsAzkarScreenState extends State<SituationsAzkarScreen> {
  @override
  void initState() {
    BlocProvider.of<GetConditionalAzkarCubit>(context).getConditionalAzkar();
    BlocProvider.of<HandleFavSituationalAzkarCubit>(context).getAllIds();
    super.initState();
  }

  List<String> listOfFavIds = [];
  bool showFavourites = false;
  List<Zikr> shownAzkar = [];

  List<Zikr> allAzkar = [];

  void updateListOfShownAzkarToFavAzkar() {
    setState(() {
      shownAzkar = [];
      for (var zikr in allAzkar) {
        if (listOfFavIds.contains(zikr.id.toString())) {
          shownAzkar.add(zikr);
        }
      }
    });
  }

  void updateListOfShownAzkarToAllAzkar() {
    setState(() {
      shownAzkar = allAzkar;
    });
  }

  void updateListOfShownAzkarToSearchedAzkar({
    required String searchText,
  }) {
    if (searchText.isEmpty) {
      if (showFavourites) {
        updateListOfShownAzkarToFavAzkar();
      } else {
        updateListOfShownAzkarToAllAzkar();
      }
    } else {
      List<Zikr> azkar = [];
      azkar = allAzkar
          .where((zikr) =>
              zikr.title!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();

      setState(() {
        shownAzkar = azkar;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HandleFavSituationalAzkarCubit,
        HandleFavSituationalAzkarState>(
      listener: (context, state) {
        if (state is HandleFavSituationalAzkarLoaded) {
          setState(() {
            listOfFavIds = state.ids;
          });
          if (showFavourites) {
            updateListOfShownAzkarToFavAzkar();
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                top: ConstantValues.appTopPadding,
                left: ConstantValues.appHorizontalPadding,
                right: ConstantValues.appHorizontalPadding),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: TitleWithBackButton(
                    title: "أذكار الأحوال",
                  ),
                ),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 41,
                )),
                SliverToBoxAdapter(
                    child: SizedBox(
                  height: 41,
                  child: Row(
                    children: [
                      Expanded(
                        child: SituationalZikrSearchWidget(
                          hintText: 'ابحث عن الذكر',
                          onChanged: (searchedText) {
                            updateListOfShownAzkarToSearchedAzkar(
                                searchText: searchedText);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showFavourites = !showFavourites;
                          });
                          if (showFavourites) {
                            updateListOfShownAzkarToFavAzkar();
                          } else {
                            updateListOfShownAzkarToAllAzkar();
                          }
                          // print(showFavourites);
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: showFavourites
                                ? const Color.fromRGBO(255, 184, 0, 1)
                                : Colors.white,
                            border: Border.all(
                                width: 1,
                                color: const Color.fromRGBO(255, 184, 0, 1)),
                          ),
                          child: Center(
                            child: Icon(
                              showFavourites
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                              color: showFavourites
                                  ? Colors.white
                                  : const Color.fromRGBO(255, 184, 0, 1),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                const SliverToBoxAdapter(
                    child: SizedBox(
                  height: 32,
                )),
                BlocConsumer<GetConditionalAzkarCubit,
                    GetConditionalAzkarState>(
                  listener: (context, state) {
                    if (state is GetConditionalAzkarLoaded) {
                      setState(() {
                        allAzkar = state.conditionalAzkar;

                        updateListOfShownAzkarToAllAzkar();
                      });
                    }
                  },
                  builder: (context, parentState) {
                    if (parentState is GetConditionalAzkarLoading) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (parentState is GetConditionalAzkarLoaded) {
                      if (shownAzkar.isEmpty) {
                        return SliverToBoxAdapter(
                            child: Center(
                                child: Text(
                          "لم يتم العثور على أي نتائج",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.red),
                        )));
                      } else {
                        return SliverList.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 16,
                            );
                          },
                          itemCount: shownAzkar.length,
                          itemBuilder: (context, index) {
                            final Zikr zikr = shownAzkar[index];
                            return (showFavourites
                                    ? listOfFavIds.contains(zikr.id.toString())
                                    : true)
                                ? SituationalZikrListTile(
                                    zikr: zikr,
                                    onTap: () {
                                      Navigator.pushNamed(context, zikrContentScreen,arguments: zikr);
                                    },
                                    trailing: GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<
                                                    HandleFavSituationalAzkarCubit>(
                                                context)
                                            .addOrRemoveFromFavourites(
                                                zikr.id.toString());
                                      },
                                      child: Icon(
                                        listOfFavIds
                                                .contains(zikr.id.toString())
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: const Color.fromRGBO(
                                            255, 184, 0, 1),
                                      ),
                                    ),
                                  )
                                : null;

                            //ZikrCard(zikr: zikr,);
                          },
                        );
                      }
                    } else if (parentState is GetConditionalAzkarError) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Text('Error loading azkar'),
                        ),
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child:
                              Text('unknown error occurd while loading azkar'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
