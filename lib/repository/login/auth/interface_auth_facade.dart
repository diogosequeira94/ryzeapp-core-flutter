import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/login/auth/entity/user.dart';
import 'package:firebaseblocryze/repository/login/auth/value_objects.dart';
import 'package:flutter/foundation.dart';

import 'auth_failure.dart';

/// Facade is a design pattern use to connect two or more classes in a plugged way
/// They are at the same level of repositories, they will simplify the interface
/// Option is basically a non nullable type, it can contain None or Some user.
abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress email,
    @required Password password,
    @required FirstName firstName,
    @required LastName lastName,
  });
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress email,
    @required Password password,
  });
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
  Future<void> signOut();
}
