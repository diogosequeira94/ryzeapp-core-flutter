part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState{
  const factory AuthState.initial() = Initial;
  const factory AuthState.firstTimeUser() = FirstTimeUser;
  const factory AuthState.authenticated(String userId) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
}
