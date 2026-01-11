import 'package:dartz/dartz.dart';

import '../layers/data/failure/failure.dart';

Future<Either<FailureBase, T>> safeAwait<T>(Future<T> Function() future) async {
  try {
    final result = await future();
    return Right(result);
  } on FailureBase catch (failure) {
    return Left(failure);
  } catch (e) {
    return Left(Failure(exception: e, message: e.toString()));
  }
}
