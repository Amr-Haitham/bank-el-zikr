import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/legacy/1_ui/core/consts/colors.dart';
import 'package:bank_el_ziker/legacy/1_ui/core/consts/images_urls.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../package:bank_el_ziker/core/utils/screen_utils.dart';
import '../../../../app_router.dart';
import 'package:bank_el_ziker/core/consts/text_styles.dart';

class ZikerBalanceWidget extends StatelessWidget {
  const ZikerBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(accountBalanceUrl);
      },
      child: Container(
        height: ScreenUtils.getScreenHeight(context) / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    ImagesUrls.zikrBalanceBackgroundLightThemeHomeScreen))),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IgnorePointer(
                child: IconButton.filled(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor),
                    icon: Icon(
                      Icons.arrow_back,
                      color: GeneralUtils.isLightTheme(context)
                          ? appDark
                          : appWhite,
                    )),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "رصيد الذكر",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: GeneralUtils.isLightTheme(context)
                            ? appWhite
                            : const Color.fromARGB(255, 0, 0, 0)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<CounterCubit, RequestState<CounterStateEntity>>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        success: (counterState) {
                          return AutoSizeText(
                            ArabicNumbers()
                                .convert(counterState.accountBalance)
                                .toString(),
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: GeneralUtils.isLightTheme(context)
                                        ? appWhite
                                        : const Color.fromARGB(255, 0, 0, 0)),
                          );
                        },
                        failure: (failure) {
                          return AutoSizeText(
                            "Error",
                            maxLines: 1,
                            textAlign: TextAlign.right,
                            style: cairoTextStyle(
                                19, FontWeight.w800, null, Colors.white),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
