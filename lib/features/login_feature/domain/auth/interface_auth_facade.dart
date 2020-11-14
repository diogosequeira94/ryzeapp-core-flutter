import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/features/login_feature/domain/auth/value_objects.dart';
import 'package:flutter/foundation.dart';

import 'auth_failure.dart';


/// Facade is a design pattern use to connect two or more classes in a plugged way
/// They are at the same level of repositories, they will simplify the interface
abstract class IAuthFacade {
 Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress email,
    @required Password password,
  });
 Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
   @required EmailAddress email,
   @required Password password,
 });
 Future<Either<AuthFailure, Unit>> signInWithGoogle();
}