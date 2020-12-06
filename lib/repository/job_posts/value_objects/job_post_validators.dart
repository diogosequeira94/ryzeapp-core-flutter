import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/job_posts/error/job_post_failures.dart';

Either<JobPostFailure<String>, String> validateInvalidLength(
    String input, int maxLength) {
  if (input.length < maxLength) {
    return right(input);
  } else {
    return left(
        JobPostFailure.invalidLength(failedValue: input, max: maxLength));
  }
}

Either<JobPostFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(JobPostFailure.empty(failedValue: input));
  }
}

Either<JobPostFailure<String>, String> validateSingleLine(String input) {
  if (!input.contains('\n')) {
    return right(input);
  } else {
    return left(JobPostFailure.multiline(failedValue: input));
  }
}

Either<JobPostFailure<List<T>>, List<T>> validateMaxListLength<T>(
  List<T> input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(JobPostFailure.listTooLong(failedValue: input, max: maxLength));
  }
}
