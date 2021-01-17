// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'job_post_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$JobPostFailureTearOff {
  const _$JobPostFailureTearOff();

  _Unexpected unexpected() {
    return const _Unexpected();
  }

  _DataCorrupted dataCorrupted() {
    return const _DataCorrupted();
  }
}

// ignore: unused_element
const $JobPostFailure = _$JobPostFailureTearOff();

mixin _$JobPostFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result dataCorrupted(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result dataCorrupted(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result dataCorrupted(_DataCorrupted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result dataCorrupted(_DataCorrupted value),
    @required Result orElse(),
  });
}

abstract class $JobPostFailureCopyWith<$Res> {
  factory $JobPostFailureCopyWith(
          JobPostFailure value, $Res Function(JobPostFailure) then) =
      _$JobPostFailureCopyWithImpl<$Res>;
}

class _$JobPostFailureCopyWithImpl<$Res>
    implements $JobPostFailureCopyWith<$Res> {
  _$JobPostFailureCopyWithImpl(this._value, this._then);

  final JobPostFailure _value;
  // ignore: unused_field
  final $Res Function(JobPostFailure) _then;
}

abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
}

class __$UnexpectedCopyWithImpl<$Res> extends _$JobPostFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(
      _Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;
}

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'JobPostFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result dataCorrupted(),
  }) {
    assert(unexpected != null);
    assert(dataCorrupted != null);
    return unexpected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result dataCorrupted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result dataCorrupted(_DataCorrupted value),
  }) {
    assert(unexpected != null);
    assert(dataCorrupted != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result dataCorrupted(_DataCorrupted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements JobPostFailure {
  const factory _Unexpected() = _$_Unexpected;
}

abstract class _$DataCorruptedCopyWith<$Res> {
  factory _$DataCorruptedCopyWith(
          _DataCorrupted value, $Res Function(_DataCorrupted) then) =
      __$DataCorruptedCopyWithImpl<$Res>;
}

class __$DataCorruptedCopyWithImpl<$Res>
    extends _$JobPostFailureCopyWithImpl<$Res>
    implements _$DataCorruptedCopyWith<$Res> {
  __$DataCorruptedCopyWithImpl(
      _DataCorrupted _value, $Res Function(_DataCorrupted) _then)
      : super(_value, (v) => _then(v as _DataCorrupted));

  @override
  _DataCorrupted get _value => super._value as _DataCorrupted;
}

class _$_DataCorrupted implements _DataCorrupted {
  const _$_DataCorrupted();

  @override
  String toString() {
    return 'JobPostFailure.dataCorrupted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _DataCorrupted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result dataCorrupted(),
  }) {
    assert(unexpected != null);
    assert(dataCorrupted != null);
    return dataCorrupted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result dataCorrupted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dataCorrupted != null) {
      return dataCorrupted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result dataCorrupted(_DataCorrupted value),
  }) {
    assert(unexpected != null);
    assert(dataCorrupted != null);
    return dataCorrupted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result dataCorrupted(_DataCorrupted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (dataCorrupted != null) {
      return dataCorrupted(this);
    }
    return orElse();
  }
}

abstract class _DataCorrupted implements JobPostFailure {
  const factory _DataCorrupted() = _$_DataCorrupted;
}
