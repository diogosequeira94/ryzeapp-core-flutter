import 'dart:ui';
import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_transformer.dart';
import 'package:firebaseblocryze/repository/job_posts/error/job_post_failures.dart';
import 'package:firebaseblocryze/repository/job_posts/value_objects/job_post_evaluator_object.dart';
import 'package:firebaseblocryze/repository/job_posts/value_objects/job_post_validators.dart';


// Objects that we want to validate
// Objects that we want to validate
class NoteBody extends JobPostEvaluatorObject<String> {
  @override
  final Either<JobPostFailure<String>, String> value;

  static const maxLength = 1000;

  // Inside this constructor, we want to validate the max length of the string && the string is not empty.
  factory NoteBody(String input) {
    assert(input != null);
    return NoteBody._(
        validateInvalidLength(input, maxLength)
            .flatMap((value) => validateStringNotEmpty(value))
    );
  }

  const NoteBody._(this.value);
}

class TodoName extends JobPostEvaluatorObject<String> {
  @override
  final Either<JobPostFailure<String>, String> value;

  static const maxLength = 30;

  // Inside this constructor, we want to validate the max length of the string && single Line && not empty.
  factory TodoName(String input) {
    assert(input != null);
    return TodoName._(
      validateInvalidLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const TodoName._(this.value);
}

//Note Colors can't have transparency

class NoteColor extends JobPostEvaluatorObject<Color> {
  static const List<Color> predefinedColors = [
    Color(0xfffafafa),
    Color(0xfffa8072),
    Color(0xfffedc56),
    Color(0xffd0f0c0),
    Color(0xfffca3b7),
    Color(0xff997950),
    Color(0xfffffdd0),
  ];

  @override
  final Either<JobPostFailure<Color>, Color> value;

  // Inside this constructor, we want to validate the max length of the string && single Line && not empty.
  factory NoteColor(Color input) {
    assert(input != null);
    return NoteColor._(
      right(makeColorOpaque(input)),
    );
  }

  const NoteColor._(this.value);
}

//This validator validates if the list max 3 items
class List3<T> extends JobPostEvaluatorObject<List<T>> {
  @override
  final Either<JobPostFailure<List<T>>, List<T>> value;

  static const maxLength = 3;

  // Inside this constructor, we want to validate the max length of the string && single Line && not empty.
  factory List3(List<T> listInput) {
    assert(listInput != null);
    return List3._(
        validateMaxListLength(listInput, maxLength)
    );
  }

  const List3._(this.value);

  //obtain length of list
  int get length {
    return value.getOrElse(() => []).length;
  }

  //Normally list can't be full, but this one can =)
  bool get isFull {
    return length == maxLength;
  }
}