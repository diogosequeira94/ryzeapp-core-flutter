import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_post_input_validators.freezed.dart';
@freezed
abstract class JobPostInputValidator<T> with _$JobPostInputValidator<T> {
  const factory JobPostInputValidator.empty({
    @required String failedValue,
  }) = Empty<T>;
  const factory JobPostInputValidator.invalidLength({
    @required String failedValue,
    @required int max,
  }) = InvalidLength<T>;
  const factory JobPostInputValidator.invalidPay({
    @required String failedValue,
  }) = InvalidPay<T>;
  const factory JobPostInputValidator.listTooLong({
    @required List failedValue,
    @required int max,
  }) = ListTooLong<T>;
  const factory JobPostInputValidator.multiline({
    @required String failedValue,
  }) = Multiline<T>;
}