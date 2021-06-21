import 'package:formz/formz.dart';

enum CityValidationError { invalid }

class City extends FormzInput<String, CityValidationError> {
  final minLength = 3;
  const City.pure() : super.pure('');
  const City.dirty([String value = '']) : super.dirty(value);

  @override
  CityValidationError validator(String value) {
    return value.length > minLength ? null : CityValidationError.invalid;
  }
}