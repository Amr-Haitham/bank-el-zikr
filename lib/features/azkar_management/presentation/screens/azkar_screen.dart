import 'package:bank_el_ziker/core/constants/colors.dart';
import 'package:bank_el_ziker/core/utils/general_utils.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/get_all_azkar_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/add_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/update_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/delete_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/get_counter_state_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/update_current_zikr_cubit.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/zikr_counter/domain/entities/counter_state.dart';
import 'package:bank_el_ziker/core/layers/presentation/widgets/title_with_back_button.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/widgets/list_tile_of_zikr.dart';
import 'sub_screens/adding_new_ziker_popup.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AddCustomZikrCubit, RequestState<void>>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) => context.read<GetAllAzkarCubit>().loadAzkar(),
            );
          },
        ),
        BlocListener<UpdateCustomZikrCubit, RequestState<void>>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) => context.read<GetAllAzkarCubit>().loadAzkar(),
            );
          },
        ),
        BlocListener<DeleteCustomZikrCubit, RequestState<void>>(
          listener: (context, state) {
            state.whenOrNull(
              success: (_) => context.read<GetAllAzkarCubit>().loadAzkar(),
            );
          },
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(
                top: 30, right: 30, left: 30, bottom: 10),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TitleWithBackButton(
                    trailing: _buildAddButton(context),
                    title: "اختر الذكر",
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 52)),
                _buildAzkarList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          builder: (dialogContext) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(dialogContext).viewInsets.bottom,
              ),
              child: BlocProvider.value(
                value: context.read<AddCustomZikrCubit>(),
                child: const AddNewZikrPopUp(),
              ),
            );
          },
        );
      },
      style:
          IconButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
      icon: Icon(
        Icons.add,
        color: GeneralUtils.isLightTheme(context) ? appWhite : appDark,
      ),
    );
  }

  Widget _buildAzkarList(BuildContext context) {
    return BlocBuilder<GetCounterStateCubit,
        RequestState<CounterStateEntity>>(
      builder: (context, counterState) {
        return counterState.when(
          initial: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          success: (counter) {
            final selectedZikrId = counter.currentZikrId;

            return BlocBuilder<GetAllAzkarCubit,
                RequestState<List<ZikrEntity>>>(
              builder: (context, azkarState) {
                return azkarState.when(
                  initial: () => const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  loading: () => const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  success: (azkar) {
                    return SliverList.separated(
                      itemCount: azkar.length,
                      itemBuilder: (context, index) {
                        return ListTileOfZikr(
                          index: index,
                          onTap: () {
                            context
                                .read<UpdateCurrentZikrCubit>()
                                .executeUpdate(azkar[index].id);
                            Navigator.pop(context);
                          },
                          zikr: azkar[index],
                          isSelected: selectedZikrId == azkar[index].id,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 64,
                          indent: 44,
                          endIndent: 44,
                        );
                      },
                    );
                  },
                  failure: (failure) => const SliverToBoxAdapter(
                    child: Center(child: Text("Error loading azkar")),
                  ),
                );
              },
            );
          },
          failure: (failure) => const SliverToBoxAdapter(
            child: Center(child: Text("Error loading counter state")),
          ),
        );
      },
    );
  }
}
