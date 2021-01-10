import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseblocryze/repository/login/auth/auth_failure.dart';
import 'package:firebaseblocryze/repository/login/auth/entity/user.dart';
import 'package:firebaseblocryze/repository/login/auth/interface_auth_facade.dart';
import 'package:firebaseblocryze/repository/login/auth/value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'firebase_user_mapper.dart';

@LazySingleton(as: IAuthFacade)
class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseAuth _firebaseAuth;
  final Firestore _fireStore;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(
    this._firebaseAuth,
    this._fireStore,
    this._googleSignIn,
  );

  @override
  Future<Option<User>> getSignedInUser() => _firebaseAuth
      .currentUser()
      .then((firebaseUser) => optionOf(firebaseUser?.toDomain()));

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress email,
    @required Password password,
    @required FirstName firstName,
    @required LastName lastName,
  }) async {
    final emailAddressString = email.getOrCrash();
    final passwordString = password.getOrCrash();
    final firstNameString = firstName.getOrCrash();
    final lastNameString = lastName.getOrCrash();

    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailAddressString, password: passwordString)
          .then((result) {
        _fireStore.collection('users').document(result.user.uid).setData({
          'firstName': firstNameString,
          'lastName': lastNameString,
          'email': emailAddressString,
        });
      });
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {EmailAddress email, Password password}) async {
    final emailAddressString = email.getOrCrash();
    final passwordString = password.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressString, password: passwordString);
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(const AuthFailure.invalidCredentials());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;

      final authCredential = GoogleAuthProvider.getCredential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken);

      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((r) => right(unit));
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  /// Future.wait its used when you want to await multiple functions
  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(
      {EmailAddress email}) async {
    final emailAddressString = email.getOrCrash();
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: emailAddressString);
      return right(unit);
    } on PlatformException catch (e) {
      if(e.code == 'ERROR_USER_NOT_FOUND'){
        return left(const AuthFailure.emailNotFound());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }
}
