part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthEvent.authCheckFirstTimeUser() = AuthCheckFirstTimeUser;
  const factory AuthEvent.signedOutPressed() = SignedOutPressed;
}
