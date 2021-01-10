// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'password_reset_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PasswordResetEventTearOff {
  const _$PasswordResetEventTearOff();

  EmailChanged emailChanged(String email) {
    return EmailChanged(
      email,
    );
  }

  SendPasswordResetEmailPressed sendPasswordResetEmailPressed() {
    return const SendPasswordResetEmailPressed();
  }
}

// ignore: unused_element
const $PasswordResetEvent = _$PasswordResetEventTearOff();

mixin _$PasswordResetEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result sendPasswordResetEmailPressed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result sendPasswordResetEmailPressed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required
        Result sendPasswordResetEmailPressed(
            SendPasswordResetEmailPressed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result sendPasswordResetEmailPressed(SendPasswordResetEmailPressed value),
    @required Result orElse(),
  });
}

abstract class $PasswordResetEventCopyWith<$Res> {
  factory $PasswordResetEventCopyWith(
          PasswordResetEvent value, $Res Function(PasswordResetEvent) then) =
      _$PasswordResetEventCopyWithImpl<$Res>;
}

class _$PasswordResetEventCopyWithImpl<$Res>
    implements $PasswordResetEventCopyWith<$Res> {
  _$PasswordResetEventCopyWithImpl(this._value, this._then);

  final PasswordResetEvent _value;
  // ignore: unused_field
  final $Res Function(PasswordResetEvent) _then;
}

abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

class _$EmailChangedCopyWithImpl<$Res>
    extends _$PasswordResetEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(EmailChanged(
      email == freezed ? _value.email : email as String,
    ));
  }
}

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email) : assert(email != null);

  @override
  final String email;

  @override
  String toString() {
    return 'PasswordResetEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result sendPasswordResetEmailPressed(),
  }) {
    assert(emailChanged != null);
    assert(sendPasswordResetEmailPressed != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result sendPasswordResetEmailPressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required
        Result sendPasswordResetEmailPressed(
            SendPasswordResetEmailPressed value),
  }) {
    assert(emailChanged != null);
    assert(sendPasswordResetEmailPressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result sendPasswordResetEmailPressed(SendPasswordResetEmailPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements PasswordResetEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email;
  $EmailChangedCopyWith<EmailChanged> get copyWith;
}

abstract class $SendPasswordResetEmailPressedCopyWith<$Res> {
  factory $SendPasswordResetEmailPressedCopyWith(
          SendPasswordResetEmailPressed value,
          $Res Function(SendPasswordResetEmailPressed) then) =
      _$SendPasswordResetEmailPressedCopyWithImpl<$Res>;
}

class _$SendPasswordResetEmailPressedCopyWithImpl<$Res>
    extends _$PasswordResetEventCopyWithImpl<$Res>
    implements $SendPasswordResetEmailPressedCopyWith<$Res> {
  _$SendPasswordResetEmailPressedCopyWithImpl(
      SendPasswordResetEmailPressed _value,
      $Res Function(SendPasswordResetEmailPressed) _then)
      : super(_value, (v) => _then(v as SendPasswordResetEmailPressed));

  @override
  SendPasswordResetEmailPressed get _value =>
      super._value as SendPasswordResetEmailPressed;
}

class _$SendPasswordResetEmailPressed implements SendPasswordResetEmailPressed {
  const _$SendPasswordResetEmailPressed();

  @override
  String toString() {
    return 'PasswordResetEvent.sendPasswordResetEmailPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SendPasswordResetEmailPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result sendPasswordResetEmailPressed(),
  }) {
    assert(emailChanged != null);
    assert(sendPasswordResetEmailPressed != null);
    return sendPasswordResetEmailPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result sendPasswordResetEmailPressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendPasswordResetEmailPressed != null) {
      return sendPasswordResetEmailPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required
        Result sendPasswordResetEmailPressed(
            SendPasswordResetEmailPressed value),
  }) {
    assert(emailChanged != null);
    assert(sendPasswordResetEmailPressed != null);
    return sendPasswordResetEmailPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result sendPasswordResetEmailPressed(SendPasswordResetEmailPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (sendPasswordResetEmailPressed != null) {
      return sendPasswordResetEmailPressed(this);
    }
    return orElse();
  }
}

abstract class SendPasswordResetEmailPressed implements PasswordResetEvent {
  const factory SendPasswordResetEmailPressed() =
      _$SendPasswordResetEmailPressed;
}

class _$PasswordResetStateTearOff {
  const _$PasswordResetStateTearOff();

  _PasswordResetState call(
      {@required EmailAddress emailAddress,
      @required bool showErrorMessages,
      @required bool isSubmitting,
      @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) {
    return _PasswordResetState(
      emailAddress: emailAddress,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $PasswordResetState = _$PasswordResetStateTearOff();

mixin _$PasswordResetState {
  EmailAddress get emailAddress;
  bool get showErrorMessages;
  bool get isSubmitting;
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;

  $PasswordResetStateCopyWith<PasswordResetState> get copyWith;
}

abstract class $PasswordResetStateCopyWith<$Res> {
  factory $PasswordResetStateCopyWith(
          PasswordResetState value, $Res Function(PasswordResetState) then) =
      _$PasswordResetStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

class _$PasswordResetStateCopyWithImpl<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  _$PasswordResetStateCopyWithImpl(this._value, this._then);

  final PasswordResetState _value;
  // ignore: unused_field
  final $Res Function(PasswordResetState) _then;

  @override
  $Res call({
    Object emailAddress = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

abstract class _$PasswordResetStateCopyWith<$Res>
    implements $PasswordResetStateCopyWith<$Res> {
  factory _$PasswordResetStateCopyWith(
          _PasswordResetState value, $Res Function(_PasswordResetState) then) =
      __$PasswordResetStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption});
}

class __$PasswordResetStateCopyWithImpl<$Res>
    extends _$PasswordResetStateCopyWithImpl<$Res>
    implements _$PasswordResetStateCopyWith<$Res> {
  __$PasswordResetStateCopyWithImpl(
      _PasswordResetState _value, $Res Function(_PasswordResetState) _then)
      : super(_value, (v) => _then(v as _PasswordResetState));

  @override
  _PasswordResetState get _value => super._value as _PasswordResetState;

  @override
  $Res call({
    Object emailAddress = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_PasswordResetState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress as EmailAddress,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

class _$_PasswordResetState implements _PasswordResetState {
  const _$_PasswordResetState(
      {@required this.emailAddress,
      @required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.authFailureOrSuccessOption})
      : assert(emailAddress != null),
        assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(authFailureOrSuccessOption != null);

  @override
  final EmailAddress emailAddress;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'PasswordResetState(emailAddress: $emailAddress, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PasswordResetState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @override
  _$PasswordResetStateCopyWith<_PasswordResetState> get copyWith =>
      __$PasswordResetStateCopyWithImpl<_PasswordResetState>(this, _$identity);
}

abstract class _PasswordResetState implements PasswordResetState {
  const factory _PasswordResetState(
          {@required
              EmailAddress emailAddress,
          @required
              bool showErrorMessages,
          @required
              bool isSubmitting,
          @required
              Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption}) =
      _$_PasswordResetState;

  @override
  EmailAddress get emailAddress;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, Unit>> get authFailureOrSuccessOption;
  @override
  _$PasswordResetStateCopyWith<_PasswordResetState> get copyWith;
}
