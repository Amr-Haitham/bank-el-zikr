part of 'request_cubit.dart';

/// A simple Union class representing the four possible states
/// of an Api request:
/// - [RequestState.initial]
/// - [RequestState.loading]
/// - [RequestState.success]
/// - [RequestState.failure]
///
/// Used by [RequestCubit] to easily create and manage requests
/// and their state.
@freezed
sealed class RequestState<T> with _$RequestState<T> {
  factory RequestState.initial() = RequestStateInitial;
  factory RequestState.loading() = RequestStateLoading;
  factory RequestState.success(T data) = RequestStateSuccess<T>;
  factory RequestState.failure(FailureBase failure) = RequestStateFailure;
}
