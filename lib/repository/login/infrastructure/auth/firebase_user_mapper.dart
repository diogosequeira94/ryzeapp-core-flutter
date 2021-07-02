import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:firebaseblocryze/repository/login/auth/entity/user.dart';
import 'package:firebaseblocryze/repository/login/core/value_object.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
