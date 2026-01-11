import '../../../constants/type_definitions.dart';

abstract interface class BaseServiceRepositoryInterface {
  Future<void> create(
      {required String uri, required String docId, required Json model});

  Future<List<Json>> getAll(String uri);

  Future<Json?> getOne({required String uri, required String docId});

  Future<void> update(
      {required String uri, required String docId, required Json model});

  Future<void> delete({required String uri, required String docId});

  Future<List<Json>> getFromIds(
      {required String uri, required List<String> docIds});

  Future<Json> getLatest({required String uri, required String orderingField});
}
