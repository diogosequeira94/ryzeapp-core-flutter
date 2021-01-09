import 'package:firebaseblocryze/repository/login/auth/value_objects.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String firstName;
  final String lastName;
  final EmailAddress emailAddress;
  final Password password;

  User({
    @required this.firstName,
    @required this.lastName,
    @required this.emailAddress,
    @required this.password,
  });
}
