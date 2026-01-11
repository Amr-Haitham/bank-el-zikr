import 'package:dartz/dartz.dart';
import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/usecases/delete_custom_zikr.dart';

/// Cubit responsible ONLY for deleting custom zikr
class DeleteCustomZikrCubit extends RequestCubit<void> {
  final DeleteCustomZikr deleteCustomZikr;

  DeleteCustomZikrCubit({
    required this.deleteCustomZikr,
  }) : super(
          callOnCreate: false,
          request: () => Future.value(const Right(null)),
        );

  /// Delete a custom zikr by ID
  Future<void> deleteZikr(int id) async {
    await execute(
      request: () => deleteCustomZikr(DeleteCustomZikrParams(id: id)),
    );
  }
}
