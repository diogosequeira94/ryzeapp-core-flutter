import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseblocryze/repository/login/auth/entity/user.dart';
import 'package:firebaseblocryze/repository/login/core/value_object.dart';

extension FirebaseUserDomainX on FirebaseUser {
  User toDomain() {
    return User(
        id: UniqueId.fromUniqueString(uid),
    );
  }
}