import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {

  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required String failedvalue,
  }) = ShortPassword<T>;

  const factory ValueFailure.shortFirstOrLastName({
    @required String failedValue,
  }) = ShortFirstOrLastName<T>;
}