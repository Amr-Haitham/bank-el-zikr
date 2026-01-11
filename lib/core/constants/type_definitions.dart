import 'package:dartz/dartz.dart';
import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';

typedef Json = Map<String, dynamic>;
typedef RequestResult<T> = Either<FailureBase, T>;
