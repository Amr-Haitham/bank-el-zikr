import 'dart:typed_data';

abstract interface class BaseStorageServiceRepositoryInterface {
  Future<String> uploadFile(
      {required Uint8List file, String? bucket, required String filePath});
  Future<Uint8List?> downloadFileFromUrl(String url);
}
