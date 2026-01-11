import 'package:dartz/dartz.dart';
import 'package:bank_el_ziker/core/constants/type_definitions.dart';
import 'package:bank_el_ziker/core/layers/data/failure/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_cubit.freezed.dart';
part 'request_state.dart';

abstract class RequestCubit<T> extends Cubit<RequestState<T>> {
  /// Abstraction of a [Cubit] that is responsible for executing
  /// a single request and managing its state.
  /// To use: simply extend this class with a new class representing
  /// some request, where [T] is the datatype of the response, for
  /// example in a `Either<Failure, T>`
  ///
  /// If it is a simple request that requires no parameters,
  /// you can provide the [request] callback in the super constructor
  /// directly.
  ///
  /// If your request requires parameters (such as in the case of a POST request,)
  /// don't provide the request immediately in the super constructor,
  /// rather add a new method to your class with the appropriate name for
  /// the request and the desired parameters, then inside it call [execute] with
  /// the [request] callback
  RequestCubit({bool callOnCreate = false, this.request})
      : assert(!callOnCreate || request != null,
            'Request cannot be null when callOnCreate is true'),
        super(RequestState<T>.initial()) {
    if (callOnCreate) {
      execute();
    }
  }

  /// The request to execute. This must be provided if [callOnCreate] was
  /// given as `true`.
  final Future<RequestResult<T>> Function()? request;

  /// Latest request executed.
  Future<RequestResult<T>> Function()? _pastRequest;

  /// The method responsible for calling the [request] and managing the state of
  /// the [RequestState]. The [request] parameter takes precedence over the
  /// [request] attribute if given.
  ///
  /// The method body simply emits a [RequestState.loading], calls the appropriate
  /// request, then determines whether to call [RequestState.success] or
  /// [RequestState.failure] depending on the result of the call.
  Future<void> execute({Future<RequestResult<T>> Function()? request}) async {
    final requestToExecute = request ?? this.request;
    _pastRequest = requestToExecute;

    if (requestToExecute == null) {
      throw Exception(
        'Unable to find a request to execute, you must either provide a request in the constructor of RequestCubit, or in the parameters of execute.',
      );
    }

    debugPrint('Executing request...');
    emit(RequestState<T>.loading());

    RequestResult<T> result;
    try {
      result = await requestToExecute();
    } catch (e) {
      result = Left(Failure(
        exception: e,
        message:
            'An error occurred while executing the request. (Likely due to JSON parsing)',
      ));
    }

    result.fold(
      (failure) {
        debugPrint('Request failed with: $failure');
        emit(RequestState<T>.failure(failure));
      },
      (data) {
        debugPrint('Request successful with: $data');
        emit(RequestState<T>.success(data));
      },
    );
  }

  /// This method is used when you want to re-execute the last request
  /// that was executed by the [execute] method.
  Future<void> reExecutePastRequest() async {
    if (_pastRequest == null) {
      throw Exception('No past request to re-execute.');
    }
    execute(request: _pastRequest);
  }

  /// This method is used when you want to modify the state of the request manually, such
  /// as when you want to add a new item to a list of items. The [getModifiedState] callback
  /// is responsible for returning the new state.
  ///
  /// This method is only available when the current state is [RequestStateSuccess].
  void modifyState(
      RequestState<T> Function(RequestStateSuccess<T> currentState)
          getModifiedState) {
    assert(state is RequestStateSuccess<T>,
        'Cannot modify state if the request was not successful.');

    final currentState = state as RequestStateSuccess<T>;

    emit(getModifiedState(currentState));
  }
}
