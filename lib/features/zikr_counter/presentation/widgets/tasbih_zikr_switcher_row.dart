import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Shows the current zikr's text with a button to switch to another one.
/// Reads live from [GetAllAzkarCubit] so it stays in sync without the
/// parent screen needing to thread azkar data down manually.
class TasbihZikrSwitcherRow extends StatelessWidget {
  const TasbihZikrSwitcherRow({super.key, required this.currentZikrId});

  final int currentZikrId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child:
                BlocBuilder<GetAllAzkarCubit, RequestState<List<ZikrEntity>>>(
              builder: (context, azkarState) {
                return azkarState.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                  failure: (f) => const SizedBox.shrink(),
                  success: (azkar) {
                    if (azkar.isEmpty) return const SizedBox.shrink();
                    final currentZikr = azkar.firstWhere(
                      (z) => z.id == currentZikrId,
                      orElse: () => azkar.first,
                    );
                    return AutoSizeText(
                      currentZikr.content,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      minFontSize: 18,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 34),
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => AutoRouter.of(context).push(const SelectZikrRoute()),
            child: Icon(Icons.swap_horiz_rounded,
                color: Theme.of(context).primaryColor, size: 34),
          ),
        ],
      ),
    );
  }
}
