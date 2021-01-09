part of 'register_bloc.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.firstNameChanged(String firstName) = FirstNameChanged;
  const factory RegisterEvent.lastNameChanged(String lastName) = LastNameChanged;
  const factory RegisterEvent.emailChanged(String email) = EmailChanged;
  const factory RegisterEvent.passwordChanged(String password) = PasswordChanged;
  const factory RegisterEvent.registerWithEmailAndPasswordPressed() =
  RegisterWithEmailAndPasswordPressed;
}
