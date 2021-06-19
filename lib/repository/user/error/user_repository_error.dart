import 'package:equatable/equatable.dart';

abstract class UserRepositoryError extends Equatable {
  const UserRepositoryError();

  @override
  List<Object> get props => [];
}

class UserRepositoryTimeoutError extends UserRepositoryError {}

class UserRepositoryNoNetworkError extends UserRepositoryError {}

class UserRepositoryHttpError extends UserRepositoryError {
  final int statusCode;

  UserRepositoryHttpError(this.statusCode);

  @override
  List<Object> get props => [statusCode];
}

class UserRepositoryGenericError extends UserRepositoryError {
  final String description;

  UserRepositoryGenericError(this.description);

  @override
  List<Object> get props => [description];
}
