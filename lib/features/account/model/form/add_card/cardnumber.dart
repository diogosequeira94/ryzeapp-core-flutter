import 'package:formz/formz.dart';

enum CardNumberValidationError { invalid }

class CardNumber extends FormzInput<String, CardNumberValidationError> {
  final minLength = 16;
  const CardNumber.pure() : super.pure('');
  const CardNumber.dirty([String value = '']) : super.dirty(value);

  @override
  CardNumberValidationError validator(String value) {
    return value.length > minLength ? null : CardNumberValidationError.invalid;
  }
}