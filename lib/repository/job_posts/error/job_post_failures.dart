import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_post_failures.freezed.dart';
@freezed
abstract class JobPostFailure<T> with _$JobPostFailure<T> {
  const factory JobPostFailure.empty({
    @required String failedValue,
  }) = Empty<T>;
  const factory JobPostFailure.invalidLength({
    @required String failedValue,
    @required int max,
  }) = InvalidLength<T>;
  const factory JobPostFailure.invalidPay({
    @required String failedValue,
  }) = InvalidPay<T>;
  const factory JobPostFailure.listTooLong({
    @required List failedValue,
    @required int max,
  }) = ListTooLong<T>;
  const factory JobPostFailure.multiline({
    @required String failedValue,
  }) = Multiline<T>;
}