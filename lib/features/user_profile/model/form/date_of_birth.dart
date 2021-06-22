import 'package:formz/formz.dart';

enum DateOfBirthValidationError { invalid }

class DateOfBirth extends FormzInput<String, DateOfBirthValidationError> {
  final minLength = 5;
  const DateOfBirth.pure() : super.pure('');
  const DateOfBirth.dirty([String value = '']) : super.dirty(value);

  @override
  DateOfBirthValidationError validator(String value) {
    return value.length > minLength ? null : DateOfBirthValidationError.invalid;
  }
}
