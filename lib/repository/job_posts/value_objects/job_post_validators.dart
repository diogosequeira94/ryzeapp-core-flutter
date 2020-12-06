import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/job_posts/error/job_post_input_validators.dart';

Either<JobPostInputValidator<String>, String> validateInvalidLength(
    String input, int maxLength) {
  if (input.length < maxLength) {
    return right(input);
  } else {
    return left(
        JobPostInputValidator.invalidLength(failedValue: input, max: maxLength));
  }
}

Either<JobPostInputValidator<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(JobPostInputValidator.empty(failedValue: input));
  }
}

Either<JobPostInputValidator<String>, String> validateSingleLine(String input) {
  if (!input.contains('\n')) {
    return right(input);
  } else {
    return left(JobPostInputValidator.multiline(failedValue: input));
  }
}

Either<JobPostInputValidator<List<T>>, List<T>> validateMaxListLength<T>(
  List<T> input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(JobPostInputValidator.listTooLong(failedValue: input, max: maxLength));
  }
}
