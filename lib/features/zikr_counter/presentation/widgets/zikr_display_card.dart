import 'package:auto_size_text/auto_size_text.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/utils/screen_utils.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZikrDisplayCard extends StatelessWidget {
  final int currentZikrId;

  const ZikrDisplayCard({super.key, required this.currentZikrId});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtils.getScreenHeight(context) / 5,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: BlocBuilder<GetAllAzkarCubit,
                RequestState<List<ZikrEntity>>>(
              builder: (context, azkarState) {
                return azkarState.when(
                  initial: () => const CircularProgressIndicator(),
                  loading: () => const CircularProgressIndicator(),
                  failure: (f) => const Text("Error loading azkar"),
                  success: (azkar) {
                    if (azkar.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    final currentZikr = azkar.firstWhere(
                      (z) => z.id == currentZikrId,
                      orElse: () => azkar.first,
                    );
                    return AutoSizeText(
                      currentZikr.content,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
