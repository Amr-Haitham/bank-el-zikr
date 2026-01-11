import 'package:dartz/dartz.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/usecases/add_custom_zikr.dart';

/// Cubit responsible ONLY for adding custom zikr
class AddCustomZikrCubit extends RequestCubit<void> {
  final AddCustomZikr addCustomZikr;

  AddCustomZikrCubit({
    required this.addCustomZikr,
  }) : super(
          callOnCreate: false,
          request: () => Future.value(const Right(null)),
        );

  /// Add a new custom zikr
  Future<void> addZikr(ZikrEntity zikr) async {
    await execute(
      request: () => addCustomZikr(AddCustomZikrParams(zikr: zikr)),
    );
  }
}
