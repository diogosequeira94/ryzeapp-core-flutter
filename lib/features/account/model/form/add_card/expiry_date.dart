import 'package:formz/formz.dart';

enum ExpiryDateValidationError { invalid }

class ExpiryDate extends FormzInput<String, ExpiryDateValidationError> {
  final minLength = 5;
  const ExpiryDate.pure() : super.pure('');
  const ExpiryDate.dirty([String value = '']) : super.dirty(value);

  @override
  ExpiryDateValidationError validator(String value) {
    return value.length > minLength ? null : ExpiryDateValidationError.invalid;
  }
}
