// changing freezed anotation from with to implements because we want some custom methods
// We are only doing this because we have evaluator objects, discarding them and making the validations in the UI will delete all this boilerplate.
import 'package:firebaseblocryze/repository/login/core/value_object.dart';
import 'package:firebaseblocryze/repository/note/models/todo_item.dart';
import 'package:firebaseblocryze/repository/note/value_objects/notes_segment_value_objects.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item_presentation_classes.freezed.dart';

@freezed
abstract class TodoItemPrimitive implements _$TodoItemPrimitive {
  const TodoItemPrimitive._();

  const factory TodoItemPrimitive({
    @required UniqueId id,
    @required String name,
    @required bool done,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: '',
        done: false,
      );

  //Converting todoItem to a DTO
  factory TodoItemPrimitive.fromDomain(TodoItem todoItem) {
    return TodoItemPrimitive(
      id: todoItem.uniqueId,
      name: todoItem.name.getOrCrash(),
      done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
        uniqueId: id,
        name: TodoName(name),
        done: done,
    );
  }
}
