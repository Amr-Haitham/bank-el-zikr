// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RequestState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(FailureBase failure) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(FailureBase failure)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(FailureBase failure)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<T> value) initial,
    required TResult Function(RequestStateLoading<T> value) loading,
    required TResult Function(RequestStateSuccess<T> value) success,
    required TResult Function(RequestStateFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<T> value)? initial,
    TResult? Function(RequestStateLoading<T> value)? loading,
    TResult? Function(RequestStateSuccess<T> value)? success,
    TResult? Function(RequestStateFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<T> value)? initial,
    TResult Function(RequestStateLoading<T> value)? loading,
    TResult Function(RequestStateSuccess<T> value)? success,
    TResult Function(RequestStateFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStateCopyWith<T, $Res> {
  factory $RequestStateCopyWith(
          RequestState<T> value, $Res Function(RequestState<T>) then) =
      _$RequestStateCopyWithImpl<T, $Res, RequestState<T>>;
}

/// @nodoc
class _$RequestStateCopyWithImpl<T, $Res, $Val extends RequestState<T>>
    implements $RequestStateCopyWith<T, $Res> {
  _$RequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RequestStateInitialImplCopyWith<T, $Res> {
  factory _$$RequestStateInitialImplCopyWith(_$RequestStateInitialImpl<T> value,
          $Res Function(_$RequestStateInitialImpl<T>) then) =
      __$$RequestStateInitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RequestStateInitialImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestStateInitialImpl<T>>
    implements _$$RequestStateInitialImplCopyWith<T, $Res> {
  __$$RequestStateInitialImplCopyWithImpl(_$RequestStateInitialImpl<T> _value,
      $Res Function(_$RequestStateInitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestStateInitialImpl<T> implements RequestStateInitial<T> {
  _$RequestStateInitialImpl();

  @override
  String toString() {
    return 'RequestState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateInitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(FailureBase failure) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(FailureBase failure)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(FailureBase failure)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<T> value) initial,
    required TResult Function(RequestStateLoading<T> value) loading,
    required TResult Function(RequestStateSuccess<T> value) success,
    required TResult Function(RequestStateFailure<T> value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<T> value)? initial,
    TResult? Function(RequestStateLoading<T> value)? loading,
    TResult? Function(RequestStateSuccess<T> value)? success,
    TResult? Function(RequestStateFailure<T> value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<T> value)? initial,
    TResult Function(RequestStateLoading<T> value)? loading,
    TResult Function(RequestStateSuccess<T> value)? success,
    TResult Function(RequestStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RequestStateInitial<T> implements RequestState<T> {
  factory RequestStateInitial() = _$RequestStateInitialImpl<T>;
}

/// @nodoc
abstract class _$$RequestStateLoadingImplCopyWith<T, $Res> {
  factory _$$RequestStateLoadingImplCopyWith(_$RequestStateLoadingImpl<T> value,
          $Res Function(_$RequestStateLoadingImpl<T>) then) =
      __$$RequestStateLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RequestStateLoadingImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestStateLoadingImpl<T>>
    implements _$$RequestStateLoadingImplCopyWith<T, $Res> {
  __$$RequestStateLoadingImplCopyWithImpl(_$RequestStateLoadingImpl<T> _value,
      $Res Function(_$RequestStateLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestStateLoadingImpl<T> implements RequestStateLoading<T> {
  _$RequestStateLoadingImpl();

  @override
  String toString() {
    return 'RequestState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(FailureBase failure) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(FailureBase failure)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(FailureBase failure)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<T> value) initial,
    required TResult Function(RequestStateLoading<T> value) loading,
    required TResult Function(RequestStateSuccess<T> value) success,
    required TResult Function(RequestStateFailure<T> value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<T> value)? initial,
    TResult? Function(RequestStateLoading<T> value)? loading,
    TResult? Function(RequestStateSuccess<T> value)? success,
    TResult? Function(RequestStateFailure<T> value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<T> value)? initial,
    TResult Function(RequestStateLoading<T> value)? loading,
    TResult Function(RequestStateSuccess<T> value)? success,
    TResult Function(RequestStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RequestStateLoading<T> implements RequestState<T> {
  factory RequestStateLoading() = _$RequestStateLoadingImpl<T>;
}

/// @nodoc
abstract class _$$RequestStateSuccessImplCopyWith<T, $Res> {
  factory _$$RequestStateSuccessImplCopyWith(_$RequestStateSuccessImpl<T> value,
          $Res Function(_$RequestStateSuccessImpl<T>) then) =
      __$$RequestStateSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$RequestStateSuccessImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestStateSuccessImpl<T>>
    implements _$$RequestStateSuccessImplCopyWith<T, $Res> {
  __$$RequestStateSuccessImplCopyWithImpl(_$RequestStateSuccessImpl<T> _value,
      $Res Function(_$RequestStateSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$RequestStateSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$RequestStateSuccessImpl<T> implements RequestStateSuccess<T> {
  _$RequestStateSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'RequestState<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestStateSuccessImplCopyWith<T, _$RequestStateSuccessImpl<T>>
      get copyWith => __$$RequestStateSuccessImplCopyWithImpl<T,
          _$RequestStateSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(FailureBase failure) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(FailureBase failure)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(FailureBase failure)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<T> value) initial,
    required TResult Function(RequestStateLoading<T> value) loading,
    required TResult Function(RequestStateSuccess<T> value) success,
    required TResult Function(RequestStateFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<T> value)? initial,
    TResult? Function(RequestStateLoading<T> value)? loading,
    TResult? Function(RequestStateSuccess<T> value)? success,
    TResult? Function(RequestStateFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<T> value)? initial,
    TResult Function(RequestStateLoading<T> value)? loading,
    TResult Function(RequestStateSuccess<T> value)? success,
    TResult Function(RequestStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class RequestStateSuccess<T> implements RequestState<T> {
  factory RequestStateSuccess(final T data) = _$RequestStateSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$RequestStateSuccessImplCopyWith<T, _$RequestStateSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestStateFailureImplCopyWith<T, $Res> {
  factory _$$RequestStateFailureImplCopyWith(_$RequestStateFailureImpl<T> value,
          $Res Function(_$RequestStateFailureImpl<T>) then) =
      __$$RequestStateFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({FailureBase failure});
}

/// @nodoc
class __$$RequestStateFailureImplCopyWithImpl<T, $Res>
    extends _$RequestStateCopyWithImpl<T, $Res, _$RequestStateFailureImpl<T>>
    implements _$$RequestStateFailureImplCopyWith<T, $Res> {
  __$$RequestStateFailureImplCopyWithImpl(_$RequestStateFailureImpl<T> _value,
      $Res Function(_$RequestStateFailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$RequestStateFailureImpl<T>(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as FailureBase,
    ));
  }
}

/// @nodoc

class _$RequestStateFailureImpl<T> implements RequestStateFailure<T> {
  _$RequestStateFailureImpl(this.failure);

  @override
  final FailureBase failure;

  @override
  String toString() {
    return 'RequestState<$T>.failure(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStateFailureImpl<T> &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestStateFailureImplCopyWith<T, _$RequestStateFailureImpl<T>>
      get copyWith => __$$RequestStateFailureImplCopyWithImpl<T,
          _$RequestStateFailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) success,
    required TResult Function(FailureBase failure) failure,
  }) {
    return failure(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? success,
    TResult? Function(FailureBase failure)? failure,
  }) {
    return failure?.call(this.failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? success,
    TResult Function(FailureBase failure)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this.failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RequestStateInitial<T> value) initial,
    required TResult Function(RequestStateLoading<T> value) loading,
    required TResult Function(RequestStateSuccess<T> value) success,
    required TResult Function(RequestStateFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RequestStateInitial<T> value)? initial,
    TResult? Function(RequestStateLoading<T> value)? loading,
    TResult? Function(RequestStateSuccess<T> value)? success,
    TResult? Function(RequestStateFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RequestStateInitial<T> value)? initial,
    TResult Function(RequestStateLoading<T> value)? loading,
    TResult Function(RequestStateSuccess<T> value)? success,
    TResult Function(RequestStateFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class RequestStateFailure<T> implements RequestState<T> {
  factory RequestStateFailure(final FailureBase failure) =
      _$RequestStateFailureImpl<T>;

  FailureBase get failure;
  @JsonKey(ignore: true)
  _$$RequestStateFailureImplCopyWith<T, _$RequestStateFailureImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
