// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'job_post_input_validators.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$JobPostInputValidatorTearOff {
  const _$JobPostInputValidatorTearOff();

// ignore: unused_element
  Empty<T> empty<T>({@required String failedValue}) {
    return Empty<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  InvalidLength<T> invalidLength<T>(
      {@required String failedValue, @required int max}) {
    return InvalidLength<T>(
      failedValue: failedValue,
      max: max,
    );
  }

// ignore: unused_element
  InvalidPay<T> invalidPay<T>({@required String failedValue}) {
    return InvalidPay<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  ListTooLong<T> listTooLong<T>(
      {@required List<dynamic> failedValue, @required int max}) {
    return ListTooLong<T>(
      failedValue: failedValue,
      max: max,
    );
  }

// ignore: unused_element
  Multiline<T> multiline<T>({@required String failedValue}) {
    return Multiline<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $JobPostInputValidator = _$JobPostInputValidatorTearOff();

/// @nodoc
mixin _$JobPostInputValidator<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(String failedValue),
    @required TResult invalidLength(String failedValue, int max),
    @required TResult invalidPay(String failedValue),
    @required TResult listTooLong(List<dynamic> failedValue, int max),
    @required TResult multiline(String failedValue),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(String failedValue),
    TResult invalidLength(String failedValue, int max),
    TResult invalidPay(String failedValue),
    TResult listTooLong(List<dynamic> failedValue, int max),
    TResult multiline(String failedValue),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(Empty<T> value),
    @required TResult invalidLength(InvalidLength<T> value),
    @required TResult invalidPay(InvalidPay<T> value),
    @required TResult listTooLong(ListTooLong<T> value),
    @required TResult multiline(Multiline<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(Empty<T> value),
    TResult invalidLength(InvalidLength<T> value),
    TResult invalidPay(InvalidPay<T> value),
    TResult listTooLong(ListTooLong<T> value),
    TResult multiline(Multiline<T> value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $JobPostInputValidatorCopyWith<T, $Res> {
  factory $JobPostInputValidatorCopyWith(JobPostInputValidator<T> value,
          $Res Function(JobPostInputValidator<T>) then) =
      _$JobPostInputValidatorCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$JobPostInputValidatorCopyWithImpl<T, $Res>
    implements $JobPostInputValidatorCopyWith<T, $Res> {
  _$JobPostInputValidatorCopyWithImpl(this._value, this._then);

  final JobPostInputValidator<T> _value;
  // ignore: unused_field
  final $Res Function(JobPostInputValidator<T>) _then;
}

/// @nodoc
abstract class $EmptyCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$EmptyCopyWithImpl<T, $Res>
    extends _$JobPostInputValidatorCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Empty<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$Empty<T> implements Empty<T> {
  const _$Empty({@required this.failedValue}) : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'JobPostInputValidator<$T>.empty(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Empty<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $EmptyCopyWith<T, Empty<T>> get copyWith =>
      _$EmptyCopyWithImpl<T, Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(String failedValue),
    @required TResult invalidLength(String failedValue, int max),
    @required TResult invalidPay(String failedValue),
    @required TResult listTooLong(List<dynamic> failedValue, int max),
    @required TResult multiline(String failedValue),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return empty(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(String failedValue),
    TResult invalidLength(String failedValue, int max),
    TResult invalidPay(String failedValue),
    TResult listTooLong(List<dynamic> failedValue, int max),
    TResult multiline(String failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(Empty<T> value),
    @required TResult invalidLength(InvalidLength<T> value),
    @required TResult invalidPay(InvalidPay<T> value),
    @required TResult listTooLong(ListTooLong<T> value),
    @required TResult multiline(Multiline<T> value),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(Empty<T> value),
    TResult invalidLength(InvalidLength<T> value),
    TResult invalidPay(InvalidPay<T> value),
    TResult listTooLong(ListTooLong<T> value),
    TResult multiline(Multiline<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements JobPostInputValidator<T> {
  const factory Empty({@required String failedValue}) = _$Empty<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  $EmptyCopyWith<T, Empty<T>> get copyWith;
}

/// @nodoc
abstract class $InvalidLengthCopyWith<T, $Res> {
  factory $InvalidLengthCopyWith(
          InvalidLength<T> value, $Res Function(InvalidLength<T>) then) =
      _$InvalidLengthCopyWithImpl<T, $Res>;
  $Res call({String failedValue, int max});
}

/// @nodoc
class _$InvalidLengthCopyWithImpl<T, $Res>
    extends _$JobPostInputValidatorCopyWithImpl<T, $Res>
    implements $InvalidLengthCopyWith<T, $Res> {
  _$InvalidLengthCopyWithImpl(
      InvalidLength<T> _value, $Res Function(InvalidLength<T>) _then)
      : super(_value, (v) => _then(v as InvalidLength<T>));

  @override
  InvalidLength<T> get _value => super._value as InvalidLength<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(InvalidLength<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

/// @nodoc
class _$InvalidLength<T> implements InvalidLength<T> {
  const _$InvalidLength({@required this.failedValue, @required this.max})
      : assert(failedValue != null),
        assert(max != null);

  @override
  final String failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'JobPostInputValidator<$T>.invalidLength(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidLength<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @JsonKey(ignore: true)
  @override
  $InvalidLengthCopyWith<T, InvalidLength<T>> get copyWith =>
      _$InvalidLengthCopyWithImpl<T, InvalidLength<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(String failedValue),
    @required TResult invalidLength(String failedValue, int max),
    @required TResult invalidPay(String failedValue),
    @required TResult listTooLong(List<dynamic> failedValue, int max),
    @required TResult multiline(String failedValue),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return invalidLength(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(String failedValue),
    TResult invalidLength(String failedValue, int max),
    TResult invalidPay(String failedValue),
    TResult listTooLong(List<dynamic> failedValue, int max),
    TResult multiline(String failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidLength != null) {
      return invalidLength(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(Empty<T> value),
    @required TResult invalidLength(InvalidLength<T> value),
    @required TResult invalidPay(InvalidPay<T> value),
    @required TResult listTooLong(ListTooLong<T> value),
    @required TResult multiline(Multiline<T> value),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return invalidLength(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(Empty<T> value),
    TResult invalidLength(InvalidLength<T> value),
    TResult invalidPay(InvalidPay<T> value),
    TResult listTooLong(ListTooLong<T> value),
    TResult multiline(Multiline<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidLength != null) {
      return invalidLength(this);
    }
    return orElse();
  }
}

abstract class InvalidLength<T> implements JobPostInputValidator<T> {
  const factory InvalidLength(
      {@required String failedValue, @required int max}) = _$InvalidLength<T>;

  String get failedValue;
  int get max;
  @JsonKey(ignore: true)
  $InvalidLengthCopyWith<T, InvalidLength<T>> get copyWith;
}

/// @nodoc
abstract class $InvalidPayCopyWith<T, $Res> {
  factory $InvalidPayCopyWith(
          InvalidPay<T> value, $Res Function(InvalidPay<T>) then) =
      _$InvalidPayCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidPayCopyWithImpl<T, $Res>
    extends _$JobPostInputValidatorCopyWithImpl<T, $Res>
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

/// @nodoc
class _$InvalidPay<T> implements InvalidPay<T> {
  const _$InvalidPay({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'JobPostInputValidator<$T>.invalidPay(failedValue: $failedValue)';
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

  @JsonKey(ignore: true)
  @override
  $InvalidPayCopyWith<T, InvalidPay<T>> get copyWith =>
      _$InvalidPayCopyWithImpl<T, InvalidPay<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(String failedValue),
    @required TResult invalidLength(String failedValue, int max),
    @required TResult invalidPay(String failedValue),
    @required TResult listTooLong(List<dynamic> failedValue, int max),
    @required TResult multiline(String failedValue),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return invalidPay(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(String failedValue),
    TResult invalidLength(String failedValue, int max),
    TResult invalidPay(String failedValue),
    TResult listTooLong(List<dynamic> failedValue, int max),
    TResult multiline(String failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidPay != null) {
      return invalidPay(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(Empty<T> value),
    @required TResult invalidLength(InvalidLength<T> value),
    @required TResult invalidPay(InvalidPay<T> value),
    @required TResult listTooLong(ListTooLong<T> value),
    @required TResult multiline(Multiline<T> value),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return invalidPay(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(Empty<T> value),
    TResult invalidLength(InvalidLength<T> value),
    TResult invalidPay(InvalidPay<T> value),
    TResult listTooLong(ListTooLong<T> value),
    TResult multiline(Multiline<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (invalidPay != null) {
      return invalidPay(this);
    }
    return orElse();
  }
}

abstract class InvalidPay<T> implements JobPostInputValidator<T> {
  const factory InvalidPay({@required String failedValue}) = _$InvalidPay<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  $InvalidPayCopyWith<T, InvalidPay<T>> get copyWith;
}

/// @nodoc
abstract class $ListTooLongCopyWith<T, $Res> {
  factory $ListTooLongCopyWith(
          ListTooLong<T> value, $Res Function(ListTooLong<T>) then) =
      _$ListTooLongCopyWithImpl<T, $Res>;
  $Res call({List<dynamic> failedValue, int max});
}

/// @nodoc
class _$ListTooLongCopyWithImpl<T, $Res>
    extends _$JobPostInputValidatorCopyWithImpl<T, $Res>
    implements $ListTooLongCopyWith<T, $Res> {
  _$ListTooLongCopyWithImpl(
      ListTooLong<T> _value, $Res Function(ListTooLong<T>) _then)
      : super(_value, (v) => _then(v as ListTooLong<T>));

  @override
  ListTooLong<T> get _value => super._value as ListTooLong<T>;

  @override
  $Res call({
    Object failedValue = freezed,
    Object max = freezed,
  }) {
    return _then(ListTooLong<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue as List<dynamic>,
      max: max == freezed ? _value.max : max as int,
    ));
  }
}

/// @nodoc
class _$ListTooLong<T> implements ListTooLong<T> {
  const _$ListTooLong({@required this.failedValue, @required this.max})
      : assert(failedValue != null),
        assert(max != null);

  @override
  final List<dynamic> failedValue;
  @override
  final int max;

  @override
  String toString() {
    return 'JobPostInputValidator<$T>.listTooLong(failedValue: $failedValue, max: $max)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ListTooLong<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)) &&
            (identical(other.max, max) ||
                const DeepCollectionEquality().equals(other.max, max)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failedValue) ^
      const DeepCollectionEquality().hash(max);

  @JsonKey(ignore: true)
  @override
  $ListTooLongCopyWith<T, ListTooLong<T>> get copyWith =>
      _$ListTooLongCopyWithImpl<T, ListTooLong<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(String failedValue),
    @required TResult invalidLength(String failedValue, int max),
    @required TResult invalidPay(String failedValue),
    @required TResult listTooLong(List<dynamic> failedValue, int max),
    @required TResult multiline(String failedValue),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return listTooLong(failedValue, max);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(String failedValue),
    TResult invalidLength(String failedValue, int max),
    TResult invalidPay(String failedValue),
    TResult listTooLong(List<dynamic> failedValue, int max),
    TResult multiline(String failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (listTooLong != null) {
      return listTooLong(failedValue, max);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(Empty<T> value),
    @required TResult invalidLength(InvalidLength<T> value),
    @required TResult invalidPay(InvalidPay<T> value),
    @required TResult listTooLong(ListTooLong<T> value),
    @required TResult multiline(Multiline<T> value),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return listTooLong(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(Empty<T> value),
    TResult invalidLength(InvalidLength<T> value),
    TResult invalidPay(InvalidPay<T> value),
    TResult listTooLong(ListTooLong<T> value),
    TResult multiline(Multiline<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (listTooLong != null) {
      return listTooLong(this);
    }
    return orElse();
  }
}

abstract class ListTooLong<T> implements JobPostInputValidator<T> {
  const factory ListTooLong(
      {@required List<dynamic> failedValue,
      @required int max}) = _$ListTooLong<T>;

  List<dynamic> get failedValue;
  int get max;
  @JsonKey(ignore: true)
  $ListTooLongCopyWith<T, ListTooLong<T>> get copyWith;
}

/// @nodoc
abstract class $MultilineCopyWith<T, $Res> {
  factory $MultilineCopyWith(
          Multiline<T> value, $Res Function(Multiline<T>) then) =
      _$MultilineCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$MultilineCopyWithImpl<T, $Res>
    extends _$JobPostInputValidatorCopyWithImpl<T, $Res>
    implements $MultilineCopyWith<T, $Res> {
  _$MultilineCopyWithImpl(
      Multiline<T> _value, $Res Function(Multiline<T>) _then)
      : super(_value, (v) => _then(v as Multiline<T>));

  @override
  Multiline<T> get _value => super._value as Multiline<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(Multiline<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$Multiline<T> implements Multiline<T> {
  const _$Multiline({@required this.failedValue}) : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'JobPostInputValidator<$T>.multiline(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Multiline<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $MultilineCopyWith<T, Multiline<T>> get copyWith =>
      _$MultilineCopyWithImpl<T, Multiline<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(String failedValue),
    @required TResult invalidLength(String failedValue, int max),
    @required TResult invalidPay(String failedValue),
    @required TResult listTooLong(List<dynamic> failedValue, int max),
    @required TResult multiline(String failedValue),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return multiline(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(String failedValue),
    TResult invalidLength(String failedValue, int max),
    TResult invalidPay(String failedValue),
    TResult listTooLong(List<dynamic> failedValue, int max),
    TResult multiline(String failedValue),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multiline != null) {
      return multiline(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(Empty<T> value),
    @required TResult invalidLength(InvalidLength<T> value),
    @required TResult invalidPay(InvalidPay<T> value),
    @required TResult listTooLong(ListTooLong<T> value),
    @required TResult multiline(Multiline<T> value),
  }) {
    assert(empty != null);
    assert(invalidLength != null);
    assert(invalidPay != null);
    assert(listTooLong != null);
    assert(multiline != null);
    return multiline(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(Empty<T> value),
    TResult invalidLength(InvalidLength<T> value),
    TResult invalidPay(InvalidPay<T> value),
    TResult listTooLong(ListTooLong<T> value),
    TResult multiline(Multiline<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (multiline != null) {
      return multiline(this);
    }
    return orElse();
  }
}

abstract class Multiline<T> implements JobPostInputValidator<T> {
  const factory Multiline({@required String failedValue}) = _$Multiline<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  $MultilineCopyWith<T, Multiline<T>> get copyWith;
}
