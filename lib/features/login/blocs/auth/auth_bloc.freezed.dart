// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

// ignore: unused_element
  AuthCheckRequested authCheckRequested() {
    return const AuthCheckRequested();
  }

// ignore: unused_element
  AuthCheckFirstTimeUser authCheckFirstTimeUser() {
    return const AuthCheckFirstTimeUser();
  }

// ignore: unused_element
  SignedOutPressed signedOutPressed() {
    return const SignedOutPressed();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult authCheckFirstTimeUser(),
    @required TResult signedOutPressed(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult authCheckFirstTimeUser(),
    TResult signedOutPressed(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required TResult authCheckFirstTimeUser(AuthCheckFirstTimeUser value),
    @required TResult signedOutPressed(SignedOutPressed value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult authCheckFirstTimeUser(AuthCheckFirstTimeUser value),
    TResult signedOutPressed(SignedOutPressed value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class $AuthCheckRequestedCopyWith<$Res> {
  factory $AuthCheckRequestedCopyWith(
          AuthCheckRequested value, $Res Function(AuthCheckRequested) then) =
      _$AuthCheckRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthCheckRequestedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthCheckRequestedCopyWith<$Res> {
  _$AuthCheckRequestedCopyWithImpl(
      AuthCheckRequested _value, $Res Function(AuthCheckRequested) _then)
      : super(_value, (v) => _then(v as AuthCheckRequested));

  @override
  AuthCheckRequested get _value => super._value as AuthCheckRequested;
}

/// @nodoc
class _$AuthCheckRequested implements AuthCheckRequested {
  const _$AuthCheckRequested();

  @override
  String toString() {
    return 'AuthEvent.authCheckRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthCheckRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult authCheckFirstTimeUser(),
    @required TResult signedOutPressed(),
  }) {
    assert(authCheckRequested != null);
    assert(authCheckFirstTimeUser != null);
    assert(signedOutPressed != null);
    return authCheckRequested();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult authCheckFirstTimeUser(),
    TResult signedOutPressed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authCheckRequested != null) {
      return authCheckRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required TResult authCheckFirstTimeUser(AuthCheckFirstTimeUser value),
    @required TResult signedOutPressed(SignedOutPressed value),
  }) {
    assert(authCheckRequested != null);
    assert(authCheckFirstTimeUser != null);
    assert(signedOutPressed != null);
    return authCheckRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult authCheckFirstTimeUser(AuthCheckFirstTimeUser value),
    TResult signedOutPressed(SignedOutPressed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authCheckRequested != null) {
      return authCheckRequested(this);
    }
    return orElse();
  }
}

abstract class AuthCheckRequested implements AuthEvent {
  const factory AuthCheckRequested() = _$AuthCheckRequested;
}

/// @nodoc
abstract class $AuthCheckFirstTimeUserCopyWith<$Res> {
  factory $AuthCheckFirstTimeUserCopyWith(AuthCheckFirstTimeUser value,
          $Res Function(AuthCheckFirstTimeUser) then) =
      _$AuthCheckFirstTimeUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthCheckFirstTimeUserCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthCheckFirstTimeUserCopyWith<$Res> {
  _$AuthCheckFirstTimeUserCopyWithImpl(AuthCheckFirstTimeUser _value,
      $Res Function(AuthCheckFirstTimeUser) _then)
      : super(_value, (v) => _then(v as AuthCheckFirstTimeUser));

  @override
  AuthCheckFirstTimeUser get _value => super._value as AuthCheckFirstTimeUser;
}

/// @nodoc
class _$AuthCheckFirstTimeUser implements AuthCheckFirstTimeUser {
  const _$AuthCheckFirstTimeUser();

  @override
  String toString() {
    return 'AuthEvent.authCheckFirstTimeUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthCheckFirstTimeUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult authCheckFirstTimeUser(),
    @required TResult signedOutPressed(),
  }) {
    assert(authCheckRequested != null);
    assert(authCheckFirstTimeUser != null);
    assert(signedOutPressed != null);
    return authCheckFirstTimeUser();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult authCheckFirstTimeUser(),
    TResult signedOutPressed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authCheckFirstTimeUser != null) {
      return authCheckFirstTimeUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required TResult authCheckFirstTimeUser(AuthCheckFirstTimeUser value),
    @required TResult signedOutPressed(SignedOutPressed value),
  }) {
    assert(authCheckRequested != null);
    assert(authCheckFirstTimeUser != null);
    assert(signedOutPressed != null);
    return authCheckFirstTimeUser(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult authCheckFirstTimeUser(AuthCheckFirstTimeUser value),
    TResult signedOutPressed(SignedOutPressed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authCheckFirstTimeUser != null) {
      return authCheckFirstTimeUser(this);
    }
    return orElse();
  }
}

abstract class AuthCheckFirstTimeUser implements AuthEvent {
  const factory AuthCheckFirstTimeUser() = _$AuthCheckFirstTimeUser;
}

/// @nodoc
abstract class $SignedOutPressedCopyWith<$Res> {
  factory $SignedOutPressedCopyWith(
          SignedOutPressed value, $Res Function(SignedOutPressed) then) =
      _$SignedOutPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignedOutPressedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $SignedOutPressedCopyWith<$Res> {
  _$SignedOutPressedCopyWithImpl(
      SignedOutPressed _value, $Res Function(SignedOutPressed) _then)
      : super(_value, (v) => _then(v as SignedOutPressed));

  @override
  SignedOutPressed get _value => super._value as SignedOutPressed;
}

/// @nodoc
class _$SignedOutPressed implements SignedOutPressed {
  const _$SignedOutPressed();

  @override
  String toString() {
    return 'AuthEvent.signedOutPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SignedOutPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult authCheckRequested(),
    @required TResult authCheckFirstTimeUser(),
    @required TResult signedOutPressed(),
  }) {
    assert(authCheckRequested != null);
    assert(authCheckFirstTimeUser != null);
    assert(signedOutPressed != null);
    return signedOutPressed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult authCheckRequested(),
    TResult authCheckFirstTimeUser(),
    TResult signedOutPressed(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedOutPressed != null) {
      return signedOutPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult authCheckRequested(AuthCheckRequested value),
    @required TResult authCheckFirstTimeUser(AuthCheckFirstTimeUser value),
    @required TResult signedOutPressed(SignedOutPressed value),
  }) {
    assert(authCheckRequested != null);
    assert(authCheckFirstTimeUser != null);
    assert(signedOutPressed != null);
    return signedOutPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult authCheckRequested(AuthCheckRequested value),
    TResult authCheckFirstTimeUser(AuthCheckFirstTimeUser value),
    TResult signedOutPressed(SignedOutPressed value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (signedOutPressed != null) {
      return signedOutPressed(this);
    }
    return orElse();
  }
}

abstract class SignedOutPressed implements AuthEvent {
  const factory SignedOutPressed() = _$SignedOutPressed;
}

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  Initial initial() {
    return const Initial();
  }

// ignore: unused_element
  FirstTimeUser firstTimeUser() {
    return const FirstTimeUser();
  }

// ignore: unused_element
  Authenticated authenticated() {
    return const Authenticated();
  }

// ignore: unused_element
  Unauthenticated unauthenticated() {
    return const Unauthenticated();
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult firstTimeUser(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult firstTimeUser(),
    TResult authenticated(),
    TResult unauthenticated(),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult firstTimeUser(FirstTimeUser value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult firstTimeUser(FirstTimeUser value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc
class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult firstTimeUser(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
  }) {
    assert(initial != null);
    assert(firstTimeUser != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult firstTimeUser(),
    TResult authenticated(),
    TResult unauthenticated(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult firstTimeUser(FirstTimeUser value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(firstTimeUser != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult firstTimeUser(FirstTimeUser value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $FirstTimeUserCopyWith<$Res> {
  factory $FirstTimeUserCopyWith(
          FirstTimeUser value, $Res Function(FirstTimeUser) then) =
      _$FirstTimeUserCopyWithImpl<$Res>;
}

/// @nodoc
class _$FirstTimeUserCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $FirstTimeUserCopyWith<$Res> {
  _$FirstTimeUserCopyWithImpl(
      FirstTimeUser _value, $Res Function(FirstTimeUser) _then)
      : super(_value, (v) => _then(v as FirstTimeUser));

  @override
  FirstTimeUser get _value => super._value as FirstTimeUser;
}

/// @nodoc
class _$FirstTimeUser implements FirstTimeUser {
  const _$FirstTimeUser();

  @override
  String toString() {
    return 'AuthState.firstTimeUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FirstTimeUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult firstTimeUser(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
  }) {
    assert(initial != null);
    assert(firstTimeUser != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return firstTimeUser();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult firstTimeUser(),
    TResult authenticated(),
    TResult unauthenticated(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (firstTimeUser != null) {
      return firstTimeUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult firstTimeUser(FirstTimeUser value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(firstTimeUser != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return firstTimeUser(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult firstTimeUser(FirstTimeUser value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (firstTimeUser != null) {
      return firstTimeUser(this);
    }
    return orElse();
  }
}

abstract class FirstTimeUser implements AuthState {
  const factory FirstTimeUser() = _$FirstTimeUser;
}

/// @nodoc
abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;
}

/// @nodoc
class _$Authenticated implements Authenticated {
  const _$Authenticated();

  @override
  String toString() {
    return 'AuthState.authenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Authenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult firstTimeUser(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
  }) {
    assert(initial != null);
    assert(firstTimeUser != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult firstTimeUser(),
    TResult authenticated(),
    TResult unauthenticated(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult firstTimeUser(FirstTimeUser value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(firstTimeUser != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult firstTimeUser(FirstTimeUser value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated() = _$Authenticated;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc
class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult firstTimeUser(),
    @required TResult authenticated(),
    @required TResult unauthenticated(),
  }) {
    assert(initial != null);
    assert(firstTimeUser != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult firstTimeUser(),
    TResult authenticated(),
    TResult unauthenticated(),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(Initial value),
    @required TResult firstTimeUser(FirstTimeUser value),
    @required TResult authenticated(Authenticated value),
    @required TResult unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(firstTimeUser != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(Initial value),
    TResult firstTimeUser(FirstTimeUser value),
    TResult authenticated(Authenticated value),
    TResult unauthenticated(Unauthenticated value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$Unauthenticated;
}
