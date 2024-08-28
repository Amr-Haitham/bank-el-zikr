import 'package:bank_el_ziker/1_ui/re-usable%20widgets/zikr_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../2_state_management/get_conditional_azkar_cubit/get_conditional_azkar_cubit.dart';
import '../../../3_data/models/zikr.dart';
import '../../core/consts/colors.dart';
import '../../re-usable widgets/title_with_back_button.dart';

class SituationsAzkarScreen extends StatefulWidget {
  const SituationsAzkarScreen({super.key});

  @override
  State<SituationsAzkarScreen> createState() => _SituationsAzkarScreenState();
}

class _SituationsAzkarScreenState extends State<SituationsAzkarScreen> {
  @override
  void initState() {
    BlocProvider.of<GetConditionalAzkarCubit>(context).getConditionalAzkar();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: 30.w, right: 30.w, left: 30.w, bottom: 10.h),
        child: Material(
          color: Colors.white,
          child: Column(
            children: [TitleWithBackButton(title: "رصيد الذكر",),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "أذكار الأحوال",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.mood,
                    size: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: BlocBuilder<GetConditionalAzkarCubit,
                    GetConditionalAzkarState>(
                  builder: (context, state) {
                    if (state is GetConditionalAzkarLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is GetConditionalAzkarLoaded) {
                      return ListView.builder(
                        itemCount: state.conditionalAzkar.length,
                        itemBuilder: (context, index) {
                          final Zikr zikr = state.conditionalAzkar[index];
                          return ZikrCard(zikr: zikr);

                          //ZikrCard(zikr: zikr,);
                        },
                      );
                    } else if (state is GetConditionalAzkarError) {
                      return const Center(
                        child: Text('Error loading azkar'),
                      );
                    } else {
                      return const Center(
                                              child: Text('unknown error occurd while loading azkar'),
                                            );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
