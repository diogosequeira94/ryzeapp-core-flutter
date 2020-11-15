import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseblocryze/features/login_feature/domain/auth/entity/user.dart';
import 'package:firebaseblocryze/features/login_feature/domain/core/value_object.dart';

extension FirebaseUserDomainX on FirebaseUser {
  User toDomain() {
    return User(
        id: UniqueId.fromUniqueString(uid),
    );
  }
}