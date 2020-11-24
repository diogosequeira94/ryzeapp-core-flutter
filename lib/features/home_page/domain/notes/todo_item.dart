import 'package:firebaseblocryze/features/home_page/domain/notes/notes_value_objects.dart';
import 'package:firebaseblocryze/features/login_feature/domain/core/value_object.dart';
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
}
