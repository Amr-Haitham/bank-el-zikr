import '../../../../core/presentation/request_cubit/request_cubit.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/zikr.dart';
import '../../domain/usecases/add_custom_zikr.dart';
import '../../domain/usecases/delete_custom_zikr.dart';
import '../../domain/usecases/get_all_azkar.dart';
import '../../domain/usecases/update_custom_zikr.dart';

/// Cubit for managing azkar (both default and custom)
/// Replaces the old AzkarCubit, AddCustomZikrCubit, UpdateCustomZikrCubit, and DeleteCustomZikrCubit
class AzkarCubit extends RequestCubit<List<Zikr>> {
  final GetAllAzkar getAllAzkar;
  final AddCustomZikr addCustomZikr;
  final UpdateCustomZikr updateCustomZikr;
  final DeleteCustomZikr deleteCustomZikr;

  AzkarCubit({
    required this.getAllAzkar,
    required this.addCustomZikr,
    required this.updateCustomZikr,
    required this.deleteCustomZikr,
  }) : super(
          callOnCreate: true,
          request: () => getAllAzkar(const NoParams()),
        );

  /// Reload azkar list (can also call execute() directly)
  Future<void> loadAzkar() async {
    await execute(request: () => getAllAzkar(const NoParams()));
  }

  /// Add a new custom zikr and reload the list
  Future<void> addZikr(Zikr zikr) async {
    final result = await addCustomZikr(AddCustomZikrParams(zikr: zikr));

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful add
    );
  }

  /// Update an existing custom zikr and reload the list
  Future<void> updateZikr(Zikr zikr) async {
    final result = await updateCustomZikr(UpdateCustomZikrParams(zikr: zikr));

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful update
    );
  }

  /// Delete a custom zikr by ID and reload the list
  Future<void> deleteZikr(int id) async {
    final result = await deleteCustomZikr(DeleteCustomZikrParams(id: id));

    result.fold(
      (failure) => null,
      (_) => reExecutePastRequest(), // Reload after successful delete
    );
  }
}
