import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/delete_zikr_record.dart';

class DeleteZikrRecordCubit extends RequestCubit<void> {
  final DeleteZikrRecord deleteZikrRecord;

  DeleteZikrRecordCubit({
    required this.deleteZikrRecord,
  }) : super();

  Future<void> executeDelete(int zikrId) async {
    execute(request: () => deleteZikrRecord(zikrId));
  }
}
