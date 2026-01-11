import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:bank_el_ziker/1_ui/core/consts/colors.dart';
import 'package:bank_el_ziker/1_ui/screens/morning_and_night_azkar_screens/common/morning_or_night_zikr_list_tile.dart';
import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/presentation/cubit/morning_night_azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'morning_or_night_zikr_content_screen.dart';

class BuildListOfAzkarWidget extends StatefulWidget {
  final bool isMorningAzkar;
  const BuildListOfAzkarWidget({super.key, required this.isMorningAzkar});

  @override
  State<BuildListOfAzkarWidget> createState() => _BuildListOfAzkarWidgetState();
}

class _BuildListOfAzkarWidgetState extends State<BuildListOfAzkarWidget> {
  @override
  void initState() {
    // Load appropriate azkar based on isMorningAzkar flag
    if (widget.isMorningAzkar) {
      context.read<MorningNightAzkarCubit>().loadMorningAzkar();
    } else {
      context.read<MorningNightAzkarCubit>().loadNightAzkar();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MorningNightAzkarCubit,
        RequestState<List<MorningNightZikr>>>(
      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(
            child: SizedBox.shrink(),
          ),
          loading: () => const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
          ),
          success: (azkarList) {
            return SliverList.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: azkarList.length,
              itemBuilder: (context, index) {
                final zikr = azkarList[index];
                return MorningOrNightZikrListTile(
                  zikr: zikr,
                  isMorningZiker: widget.isMorningAzkar,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MorningOrNightZikrContentScreen(
                              isMorningZikr: widget.isMorningAzkar,
                              azkar: azkarList,
                              index: index,
                            )));
                  },
                  trailing: CircleAvatar(
                    radius: 16,
                    backgroundColor: const Color.fromRGBO(255, 184, 0, 1),
                    child: Center(
                      child: Text(
                        ArabicNumbers().convert(zikr.count).toString(),
                        textAlign: TextAlign.center,
                        textHeightBehavior: const TextHeightBehavior(
                            leadingDistribution: TextLeadingDistribution.even,
                            applyHeightToLastDescent: false,
                            applyHeightToFirstAscent: false),
                        strutStyle: const StrutStyle(
                          height: 1.0,
                          forceStrutHeight: true,
                        ),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: appWhite, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                );
              },
            );
          },
          failure: (failure) => const SliverToBoxAdapter(
            child: Center(
              child: Text('Error loading azkar'),
            ),
          ),
        );
      },
    );
  }
}
