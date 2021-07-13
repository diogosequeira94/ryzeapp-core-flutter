import 'package:formz/formz.dart';

enum ShiftDurationValidationError { invalid }

class ShiftDuration extends FormzInput<String, ShiftDurationValidationError> {
  final minLength = 1;
  const ShiftDuration.pure() : super.pure('');
  const ShiftDuration.dirty([String value = '']) : super.dirty(value);

  @override
  ShiftDurationValidationError validator(String value) {
    return value.length >= minLength
        ? null
        : ShiftDurationValidationError.invalid;
  }
}
