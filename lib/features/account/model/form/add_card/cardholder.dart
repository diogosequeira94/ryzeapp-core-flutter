import 'package:formz/formz.dart';

enum CardholderValidationError { invalid }

class Cardholder extends FormzInput<String, CardholderValidationError> {
  final minLength = 3;
  const Cardholder.pure() : super.pure('Jon Doe');
  const Cardholder.dirty([String value = '']) : super.dirty(value);

  @override
  CardholderValidationError validator(String value) {
    return value.length > minLength ? null : CardholderValidationError.invalid;
  }
}
