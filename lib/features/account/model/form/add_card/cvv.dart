import 'package:formz/formz.dart';

enum CVVValidationError { invalid }

class CVV extends FormzInput<String, CVVValidationError> {
  final minLength = 3;
  const CVV.pure() : super.pure('');
  const CVV.dirty([String value = '']) : super.dirty(value);

  @override
  CVVValidationError validator(String value) {
    return value.length > minLength ? null : CVVValidationError.invalid;
  }
}
