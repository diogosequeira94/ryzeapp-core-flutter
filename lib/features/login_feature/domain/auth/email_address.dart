import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class EmailAddress extends Equatable {
  final String emailValue;

  factory EmailAddress(String input){
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input)
    );
  }

  const EmailAddress._(this.emailValue);

  @override
  List<Object> get props => [emailValue];

  @override
  String toString() => 'EmailAdress($emailValue)';
}

String validateEmailAddress(String input) {
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if(RegExp(emailRegex).hasMatch(input)){
    return input;
  } else {
    throw InvalidEmailException(failedEmailValue: input);
  }
}

class InvalidEmailException implements Exception {
  final String failedEmailValue;
  InvalidEmailException({@required this.failedEmailValue});
}