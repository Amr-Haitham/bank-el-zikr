import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/fix_and_increment_record.dart';

class FixAndIncrementRecordCubit extends RequestCubit<void> {
  final FixAndIncrementRecord fixAndIncrementRecord;

  FixAndIncrementRecordCubit({
    required this.fixAndIncrementRecord,
  }) : super();

  Future<void> executeFixAndIncrement(
      FixAndIncrementRecordParams params) async {
    execute(request: () => fixAndIncrementRecord(params));
  }
}
