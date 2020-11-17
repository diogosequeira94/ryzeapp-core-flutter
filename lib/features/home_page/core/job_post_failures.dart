import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_post_failures.freezed.dart';
@freezed
abstract class JobPostFailure<T> with _$JobPostFailure<T> {
  const factory JobPostFailure.emptyJobTitle({
    @required String failedValue,
  }) = EmptyJobTitle<T>;
  const factory JobPostFailure.invalidLength({
    @required String failedValue,
    @required int min,
  }) = InvalidLength<T>;
  const factory JobPostFailure.invalidPay({
    @required String failedValue,
  }) = InvalidPay<T>;
  const factory JobPostFailure.listTooLong({
    @required String failedValue,
  }) = ListTooLong<T>;
}