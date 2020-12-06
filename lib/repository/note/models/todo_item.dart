import 'package:firebaseblocryze/features/login_feature/domain/core/value_object.dart';
import 'package:firebaseblocryze/repository/note/value_objects/notes_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem with _$TodoItem {
  const factory TodoItem({
    @required UniqueId uniqueId,
    @required TodoName name,
    @required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
    uniqueId: UniqueId(),
    name: TodoName(' '),
    done: false,
  );

//  //Report possible Failures
//  Option<JobPostFailure<dynamic>> get failureOption {
//      return name.value.fold((failure) => some(failure), (_) => none());
//  }
}
