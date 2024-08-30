import 'package:bank_el_ziker/1_ui/screens/morning_and_night_azkar_screens/common/ziker_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../2_state_management/get_all_morning_or_night_azkar_cubit/get_all_morning_or_night_azkar_cubit.dart';
import '../../../../3_data/models/morning_or_night_zikr.dart';

List<MorningOrNightZikr> morningOrNightAzkarList = [];

void fillListOfAzkar(List<MorningOrNightZikr> list) {
  // print("called now");
  morningOrNightAzkarList.clear();
  for (int i = 0; i < list.length; i++) {
    if (morningOrNightAzkarList.contains(list[i])) {
      continue;
    } else {
      morningOrNightAzkarList.add(list[i]);
    }
  }
}

class BuildListOfAzkarWidget extends StatefulWidget {
  final bool isMorningAzkar;
  const BuildListOfAzkarWidget({super.key, required this.isMorningAzkar});

  @override
  State<BuildListOfAzkarWidget> createState() => _BuildListOfAzkarWidgetState();
}

class _BuildListOfAzkarWidgetState extends State<BuildListOfAzkarWidget> {
  @override
  void initState() {
    BlocProvider.of<GetAllMorningOrNightAzkarCubit>(context)
        .getAllMorningOrNightAzkar(isMorningZikr: widget.isMorningAzkar);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMorningOrNightAzkarCubit,
        GetAllMorningOrNightAzkarState>(
      builder: (context, state) {
        if (state is GetAllMorningOrNightAzkarLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            ),
          );
        } else if (state is GetAllMorningOrNightAzkarLoaded) {
          fillListOfAzkar(state.morningOrNightZikr);

          return SliverList.separated(
            separatorBuilder: (context, index) {
              return const SizedBox(height: 16,);
            },
            itemCount: state.morningOrNightZikr.length,
            itemBuilder: (context, index) {
              final zikr = state.morningOrNightZikr[index];
              return ZikerTile(
                zikr: zikr,
                isMorningZiker: widget.isMorningAzkar,
              );
              //   ListTile(
              //   title: Text(zikr.content),
              // );
            },
          );
        } else if (state is GetAllMorningOrNightAzkarError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Error loading azkar'),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
                        child: Text('unknown error occurd while loading azkar'),
                      ),
          );
        }
      },
    );
  }
}
