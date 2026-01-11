import '../constants/type_definitions.dart';

/// Base class for all use cases
/// [Type] is the return type
/// [Params] is the parameters type
abstract class UseCase<Result, Params> {
  Future<RequestResult<Result>> call(Params params);
}

/// Used when a use case doesn't need parameters
class NoParams {
  const NoParams();
}
