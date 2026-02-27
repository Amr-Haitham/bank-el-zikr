import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/presentation/cubit/morning_night_azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'morning_or_night_zikr_list_tile.dart';
import '../screens/morning_or_night_zikr_content_screen.dart';

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
        RequestState<List<MorningNightZikrEntity>>>(
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
                  index: index,
                  total: azkarList.length,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MorningOrNightZikrContentScreen(
                              isMorningZikr: widget.isMorningAzkar,
                              azkar: azkarList,
                              index: index,
                            )));
                  },
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
