import 'package:dartz/dartz.dart';
import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/usecases/update_custom_zikr.dart';

/// Cubit responsible ONLY for updating custom zikr
class UpdateCustomZikrCubit extends RequestCubit<void> {
  final UpdateCustomZikr updateCustomZikr;

  UpdateCustomZikrCubit({
    required this.updateCustomZikr,
  }) : super(
          callOnCreate: false,
          request: () => Future.value(const Right(null)),
        );

  /// Update an existing custom zikr
  Future<void> updateZikr(Zikr zikr) async {
    await execute(
      request: () => updateCustomZikr(UpdateCustomZikrParams(zikr: zikr)),
    );
  }
}
