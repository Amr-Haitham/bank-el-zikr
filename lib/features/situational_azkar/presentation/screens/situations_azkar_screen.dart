import 'package:bank_el_ziker/features/situational_azkar/presentation/widgets/situational_zikr_list_tile.dart';
import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/situational_azkar/presentation/cubit/situational_azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_el_ziker/app_router.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';
import 'package:bank_el_ziker/core/presentation/widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/features/situational_azkar/presentation/widgets/situational_zikr_search_widget.dart';

class SituationsAzkarScreen extends StatefulWidget {
  const SituationsAzkarScreen({super.key});

  @override
  State<SituationsAzkarScreen> createState() => _SituationsAzkarScreenState();
}

class _SituationsAzkarScreenState extends State<SituationsAzkarScreen> {
  @override
  void initState() {
    // Load favorites on init
    context.read<SituationalAzkarCubit>().loadFavorites();
    super.initState();
  }

  List<int> listOfFavIds = [];
  bool showFavourites = false;
  List<Zikr> shownAzkar = [];

  List<Zikr> allAzkar = [];

  void updateListOfShownAzkarToFavAzkar() {
    setState(() {
      shownAzkar = [];
      for (var zikr in allAzkar) {
        if (listOfFavIds.contains(zikr.id)) {
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
    final cubit = context.read<SituationalAzkarCubit>();

    return Scaffold(
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
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: showFavourites
                              ? const Color.fromRGBO(255, 184, 0, 1)
                              : Theme.of(context).scaffoldBackgroundColor,
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
                                ? Theme.of(context).scaffoldBackgroundColor
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
              BlocBuilder<SituationalAzkarCubit, RequestState<List<Zikr>>>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    ),
                    loading: () => const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    success: (azkar) {
                      // Update local state when azkar are loaded
                      if (allAzkar != azkar) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            allAzkar = azkar;
                            listOfFavIds = cubit.favoriteIds;
                            updateListOfShownAzkarToAllAzkar();
                          });
                        });
                      }

                      if (shownAzkar.isEmpty) {
                        return SliverToBoxAdapter(
                            child: Center(
                                child: Text(
                          showFavourites
                              ? "لا يوجد أذكار في المفضلة"
                              : "لم يتم العثور على أي نتائج",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
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
                                    ? cubit.isFavorite(zikr.id)
                                    : true)
                                ? SituationalZikrListTile(
                                    zikr: zikr,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, zikrContentScreen,
                                          arguments: zikr);
                                    },
                                    trailing: GestureDetector(
                                      onTap: () {
                                        cubit.toggleFavoriteZikr(zikr.id);
                                        // Update local favorites list
                                        setState(() {
                                          listOfFavIds = cubit.favoriteIds;
                                          if (showFavourites) {
                                            updateListOfShownAzkarToFavAzkar();
                                          }
                                        });
                                      },
                                      child: Icon(
                                        cubit.isFavorite(zikr.id)
                                            ? Icons.star_rounded
                                            : Icons.star_outline_rounded,
                                        color: const Color.fromRGBO(
                                            255, 184, 0, 1),
                                      ),
                                    ),
                                  )
                                : null;
                          },
                        );
                      }
                    },
                    failure: (failure) => const SliverToBoxAdapter(
                      child: Center(
                        child: Text('Error loading azkar'),
                      ),
                    ),
                  );
                },
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: ConstantValues.appBottomPadding,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
