import 'package:formz/formz.dart';

enum HourRateValidationError { invalid }

class HourRate extends FormzInput<String, HourRateValidationError> {
  final minLength = 1;
  const HourRate.pure() : super.pure('');
  const HourRate.dirty([String value = '']) : super.dirty(value);

  @override
  HourRateValidationError validator(String value) {
    return value.length > minLength ? null : HourRateValidationError.invalid;
  }
}