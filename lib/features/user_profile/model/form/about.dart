import 'package:formz/formz.dart';

enum AboutValidationError { invalid }

class About extends FormzInput<String, AboutValidationError> {
  final minLength = 10;
  const About.pure() : super.pure('');
  const About.dirty([String value = '']) : super.dirty(value);

  @override
  AboutValidationError validator(String value) {
    return value.length > minLength ? null : AboutValidationError.invalid;
  }
}
