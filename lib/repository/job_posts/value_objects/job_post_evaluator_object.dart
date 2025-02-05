import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/job_posts/error/job_post_input_validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
abstract class JobPostEvaluatorObject<T> {
  const JobPostEvaluatorObject();

  Either<JobPostInputValidator<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [JobPostFalures]
  T getOrCrash() {
    // id = identity function - same writing (right) => right, returns the same
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is JobPostEvaluatorObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

//This class us a copy of the one inside Core
class UnexpectedValueError extends Error {
  final JobPostInputValidator jobPostFailure;

  UnexpectedValueError(this.jobPostFailure);

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was: $jobPostFailure');
  }
}