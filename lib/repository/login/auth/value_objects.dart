import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/login/core/failures.dart';
import 'package:firebaseblocryze/repository/login/core/value_object.dart';
import 'package:firebaseblocryze/repository/login/core/value_validators.dart';



class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input){
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input){
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
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
