import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/features/login_feature/domain/core/failures.dart';
import 'package:firebaseblocryze/features/login_feature/domain/core/value_objects.dart';
import 'package:firebaseblocryze/features/login_feature/domain/core/value_validators.dart';


class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> emailValue;

  factory EmailAddress(String input){
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.emailValue);
}

class PasswordAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> emailValue;

  factory PasswordAddress(String input){
    assert(input != null);
    return PasswordAddress._(
      validatePassword(input),
    );
  }

  const PasswordAddress._(this.emailValue);
}

//// Just an example on how can we get the failure or the actual content
//void showTheEmailAddressOrFailure(){
//  final emailAddress = EmailAddress('jasjd');
//
//  String emailText = emailAddress.emailValue.fold(
//          (l) => 'Failure happened, more precisely: $l',
//          (r) => r,
//  );
//
//  String emailText2 = emailAddress.emailValue.getOrElse(() => 'Some failure happened');
