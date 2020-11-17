// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'job_post_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$JobPostFailureTearOff {
  const _$JobPostFailureTearOff();

  EmptyJobTitle<T> emptyJobTitle<T>({@required String failedValue}) {
    return EmptyJobTitle<T>(
      failedValue: failedValue,
    );
  }

  InvalidLength<T> invalidLength<T>(
      {@required String failedValue, @required int min}) {
    return InvalidLength<T>(
      failedValue: failedValue,
      min: min,
    );
  }

  InvalidPay<T> invalidPay<T>({@required String failedValue}) {
    return InvalidPay<T>(
      failedValue: failedValue,
    );
  }

  ListTooLong<T> listTooLong<T>({@required String failedValue}) {
    return ListTooLong<T>(
      failedValue: failedValue,
    );
  }
}

// ignore: unused_element
const $JobPostFailure = _$JobPostFailureTearOff();

mixin _$JobPostFailure<T> {
  String get failedValue;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyJobTitle(String failedValue),
    @required Result invalidLength(String failedValue, int min),
    @required Result invalidPay(String failedValue),
    @required Result listTooLong(String failedValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyJobTitle(String failedValue),
    Result invalidLength(String failedValue, int min),
    Result invalidPay(String failedValue),
    Result listTooLong(String failedValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyJobTitle(EmptyJobTitle<T> value),
    @required Result invalidLength(InvalidLength<T> value),
    @required Result invalidPay(InvalidPay<T> value),
    @required Result listTooLong(ListTooLong<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyJobTitle(EmptyJobTitle<T> value),
    Result invalidLength(InvalidLength<T> value),
    Result invalidPay(InvalidPay<T> value),
    Result listTooLong(ListTooLong<T> value),
    @required Result orElse(),
  });

  $JobPostFailureCopyWith<T, JobPostFailure<T>> get copyWith;
}

abstract class $JobPostFailureCopyWith<T, $Res> {
  factory $JobPostFailureCopyWith(
          JobPostFailure<T> value, $Res Function(JobPostFailure<T>) then) =
      _$JobPostFailureCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

class _$JobPostFailureCopyWithImpl<T, $Res>
    implements $JobPostFailureCopyWith<T, $Res> {
  _$JobPostFailureCopyWithImpl(this._value, this._then);

  final JobPostFailure<T> _value;
  // ignore: unused_field
  final $Res Function(JobPostFailure<T>) _then;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

abstract class $EmptyJobTitleCopyWith<T, $Res>
    implements $JobPostFailureCopyWith<T, $Res> {
  factory $EmptyJobTitleCopyWith(
          EmptyJobTitle<T> value, $Res Function(EmptyJobTitle<T>) then) =
      _$EmptyJobTitleCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

class _$EmptyJobTitleCopyWithImpl<T, $Res>
    extends _$JobPostFailureCopyWithImpl<T, $Res>
    implements $EmptyJobTitleCopyWith<T, $Res> {
  _$EmptyJobTitleCopyWithImpl(
      EmptyJobTitle<T> _value, $Res Function(EmptyJobTitle<T>) _then)
      : super(_value, (v) => _then(v as EmptyJobTitle<T>));

  @override
  EmptyJobTitle<T> get _value => super._value as EmptyJobTitle<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(EmptyJobTitle<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

class _$EmptyJobTitle<T> implements EmptyJobTitle<T> {
  const _$EmptyJobTitle({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'JobPostFailure<$T>.emptyJobTitle(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmptyJobTitle<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $EmptyJobTitleCopyWith<T, EmptyJobTitle<T>> get copyWith =>
      _$EmptyJobTitleCopyWithImpl<T, EmptyJobTitle<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyJobTitle(String failedValue),
    @required Result invalidLength(String failedValue, int min),
    @required Result invalidPay(String failedValue),
    @required Result listTooLong(String failedValue),
  }) {
    assert(emptyJobTitle != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    return emptyJobTitle(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyJobTitle(String failedValue),
    Result invalidLength(String failedValue, int min),
    Result invalidPay(String failedValue),
    Result listTooLong(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyJobTitle != null) {
      return emptyJobTitle(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyJobTitle(EmptyJobTitle<T> value),
    @required Result invalidLength(InvalidLength<T> value),
    @required Result invalidPay(InvalidPay<T> value),
    @required Result listTooLong(ListTooLong<T> value),
  }) {
    assert(emptyJobTitle != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    return emptyJobTitle(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyJobTitle(EmptyJobTitle<T> value),
    Result invalidLength(InvalidLength<T> value),
    Result invalidPay(InvalidPay<T> value),
    Result listTooLong(ListTooLong<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyJobTitle != null) {
      return emptyJobTitle(this);
    }
    return orElse();
  }
}

abstract class EmptyJobTitle<T> implements JobPostFailure<T> {
  const factory EmptyJobTitle({@required String failedValue}) =
      _$EmptyJobTitle<T>;

  @override
  String get failedValue;
  @override
  $EmptyJobTitleCopyWith<T, EmptyJobTitle<T>> get copyWith;
}

abstract class $InvalidLengthCopyWith<T, $Res>
    implements $JobPostFailureCopyWith<T, $Res> {
  factory $InvalidLengthCopyWith(
          InvalidLength<T> value, $Res Function(InvalidLength<T>) then) =
      _$InvalidLengthCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue, int min});
}

class _$InvalidLengthCopyWithImpl<T, $Res>
    extends _$JobPostFailureCopyWithImpl<T, $Res>
    implements $InvalidLengthCopyWith<T, $Res> {
  _$InvalidLengthCopyWithImpl(
      InvalidLength<T> _value, $Res Function(InvalidLength<T>) _then)
      : super(_value, (v) => _then(v as InvalidLength<T>));

  @override
  InvalidLength<T> get _value => super._value as InvalidLength<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object min = freezed,
  }) {
    return _then(InvalidLength<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
      min: min == freezed ? _value.min : min as int,
    ));
  }
}

class _$InvalidLength<T> implements InvalidLength<T> {
  const _$InvalidLength({@required this.failedValue, @required this.min})
      : assert(failedValue != null),
        assert(min != null);

  @override
  final String failedValue;
  @override
  final int min;

  @override
  String toString() {
    return 'JobPostFailure<$T>.invalidLength(failedValue: $failedValue, min: $min)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidLength<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.min, min) ||
                const DeepCollectionEquality().equals(other.min, min)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(min);

  @override
  $InvalidLengthCopyWith<T, InvalidLength<T>> get copyWith =>
      _$InvalidLengthCopyWithImpl<T, InvalidLength<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyJobTitle(String failedValue),
    @required Result invalidLength(String failedValue, int min),
    @required Result invalidPay(String failedValue),
    @required Result listTooLong(String failedValue),
  }) {
    assert(emptyJobTitle != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    return invalidLength(failedValue, min);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyJobTitle(String failedValue),
    Result invalidLength(String failedValue, int min),
    Result invalidPay(String failedValue),
    Result listTooLong(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidLength != null) {
      return invalidLength(failedValue, min);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyJobTitle(EmptyJobTitle<T> value),
    @required Result invalidLength(InvalidLength<T> value),
    @required Result invalidPay(InvalidPay<T> value),
    @required Result listTooLong(ListTooLong<T> value),
  }) {
    assert(emptyJobTitle != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    return invalidLength(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyJobTitle(EmptyJobTitle<T> value),
    Result invalidLength(InvalidLength<T> value),
    Result invalidPay(InvalidPay<T> value),
    Result listTooLong(ListTooLong<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidLength != null) {
      return invalidLength(this);
    }
    return orElse();
  }
}

abstract class InvalidLength<T> implements JobPostFailure<T> {
  const factory InvalidLength(
      {@required String failedValue, @required int min}) = _$InvalidLength<T>;

  @override
  String get failedValue;
  int get min;
  @override
  $InvalidLengthCopyWith<T, InvalidLength<T>> get copyWith;
}

abstract class $InvalidPayCopyWith<T, $Res>
    implements $JobPostFailureCopyWith<T, $Res> {
  factory $InvalidPayCopyWith(
          InvalidPay<T> value, $Res Function(InvalidPay<T>) then) =
      _$InvalidPayCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

class _$InvalidPayCopyWithImpl<T, $Res>
    extends _$JobPostFailureCopyWithImpl<T, $Res>
    implements $InvalidPayCopyWith<T, $Res> {
  _$InvalidPayCopyWithImpl(
      InvalidPay<T> _value, $Res Function(InvalidPay<T>) _then)
      : super(_value, (v) => _then(v as InvalidPay<T>));

  @override
  InvalidPay<T> get _value => super._value as InvalidPay<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidPay<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

class _$InvalidPay<T> implements InvalidPay<T> {
  const _$InvalidPay({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'JobPostFailure<$T>.invalidPay(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidPay<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidPayCopyWith<T, InvalidPay<T>> get copyWith =>
      _$InvalidPayCopyWithImpl<T, InvalidPay<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyJobTitle(String failedValue),
    @required Result invalidLength(String failedValue, int min),
    @required Result invalidPay(String failedValue),
    @required Result listTooLong(String failedValue),
  }) {
    assert(emptyJobTitle != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    return invalidPay(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyJobTitle(String failedValue),
    Result invalidLength(String failedValue, int min),
    Result invalidPay(String failedValue),
    Result listTooLong(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPay != null) {
      return invalidPay(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyJobTitle(EmptyJobTitle<T> value),
    @required Result invalidLength(InvalidLength<T> value),
    @required Result invalidPay(InvalidPay<T> value),
    @required Result listTooLong(ListTooLong<T> value),
  }) {
    assert(emptyJobTitle != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    return invalidPay(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyJobTitle(EmptyJobTitle<T> value),
    Result invalidLength(InvalidLength<T> value),
    Result invalidPay(InvalidPay<T> value),
    Result listTooLong(ListTooLong<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPay != null) {
      return invalidPay(this);
    }
    return orElse();
  }
}

abstract class InvalidPay<T> implements JobPostFailure<T> {
  const factory InvalidPay({@required String failedValue}) = _$InvalidPay<T>;

  @override
  String get failedValue;
  @override
  $InvalidPayCopyWith<T, InvalidPay<T>> get copyWith;
}

abstract class $ListTooLongCopyWith<T, $Res>
    implements $JobPostFailureCopyWith<T, $Res> {
  factory $ListTooLongCopyWith(
          ListTooLong<T> value, $Res Function(ListTooLong<T>) then) =
      _$ListTooLongCopyWithImpl<T, $Res>;
  @override
  $Res call({String failedValue});
}

class _$ListTooLongCopyWithImpl<T, $Res>
    extends _$JobPostFailureCopyWithImpl<T, $Res>
    implements $ListTooLongCopyWith<T, $Res> {
  _$ListTooLongCopyWithImpl(
      ListTooLong<T> _value, $Res Function(ListTooLong<T>) _then)
      : super(_value, (v) => _then(v as ListTooLong<T>));

  @override
  ListTooLong<T> get _value => super._value as ListTooLong<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(ListTooLong<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

class _$ListTooLong<T> implements ListTooLong<T> {
  const _$ListTooLong({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'JobPostFailure<$T>.listTooLong(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ListTooLong<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $ListTooLongCopyWith<T, ListTooLong<T>> get copyWith =>
      _$ListTooLongCopyWithImpl<T, ListTooLong<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emptyJobTitle(String failedValue),
    @required Result invalidLength(String failedValue, int min),
    @required Result invalidPay(String failedValue),
    @required Result listTooLong(String failedValue),
  }) {
    assert(emptyJobTitle != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    return listTooLong(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emptyJobTitle(String failedValue),
    Result invalidLength(String failedValue, int min),
    Result invalidPay(String failedValue),
    Result listTooLong(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (listTooLong != null) {
      return listTooLong(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emptyJobTitle(EmptyJobTitle<T> value),
    @required Result invalidLength(InvalidLength<T> value),
    @required Result invalidPay(InvalidPay<T> value),
    @required Result listTooLong(ListTooLong<T> value),
  }) {
    assert(emptyJobTitle != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    return listTooLong(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emptyJobTitle(EmptyJobTitle<T> value),
    Result invalidLength(InvalidLength<T> value),
    Result invalidPay(InvalidPay<T> value),
    Result listTooLong(ListTooLong<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (listTooLong != null) {
      return listTooLong(this);
    }
    return orElse();
  }
}

abstract class ListTooLong<T> implements JobPostFailure<T> {
  const factory ListTooLong({@required String failedValue}) = _$ListTooLong<T>;

  @override
  String get failedValue;
  @override
  $ListTooLongCopyWith<T, ListTooLong<T>> get copyWith;
}
