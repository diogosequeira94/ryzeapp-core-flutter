import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_post_failure.freezed.dart';

@freezed
abstract class JobPostFailure with _$JobPostFailure {
  const factory JobPostFailure.unexpected() = _Unexpected;
  const factory JobPostFailure.dataCorrupted() = _DataCorrupted;
}