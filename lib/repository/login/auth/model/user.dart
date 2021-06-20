import 'package:firebaseblocryze/repository/login/auth/value_objects.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String userId;
  final FirstName firstName;
  final LastName lastName;
  final EmailAddress emailAddress;
  final Password password;

  User({
    @required this.userId,
    @required this.firstName,
    @required this.lastName,
    @required this.emailAddress,
    @required this.password,
  });
}
