import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/core/layers/domain/usecases/usecase.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/entities/week_azkar_record.dart';
import 'package:bank_el_ziker/features/azkar_records/domain/usecases/get_week_azkar_records.dart';

class GetWeekAzkarRecordsCubit extends RequestCubit<WeekAzkarRecord> {
  final GetWeekAzkarRecords getWeekAzkarRecords;

  GetWeekAzkarRecordsCubit({
    required this.getWeekAzkarRecords,
  }) : super(
          callOnCreate: true,
          request: () async {
            final result = await getWeekAzkarRecords(const NoParams());
            return result
                .map((records) => WeekAzkarRecord.fromDailyRecords(records));
          },
        );
}
