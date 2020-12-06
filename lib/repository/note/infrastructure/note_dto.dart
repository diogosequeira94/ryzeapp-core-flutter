import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/features/login_feature/domain/core/value_object.dart';
import 'package:firebaseblocryze/repository/note/models/todo_item.dart';
import 'package:firebaseblocryze/repository/note/value_objects/notes_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_dto.freezed.dart';
part 'note_dto.g.dart';

@freezed
abstract class NoteDto implements _$NoteDto {
  const NoteDto._();

  const factory NoteDto({
    @JsonKey(ignore: true) String id,
    @required String body,
    @required int color,
    @required List<TodoItemDto> todos,
  }) = _NoteDto;

  factory NoteDto.fromJson(Map<String, dynamic> json) => _$NoteDtoFromJson(json);
}

// Entities will later on be converted to Data Transfer Objects
@freezed
abstract class TodoItemDto implements _$TodoItemDto {
  const TodoItemDto._();

  const factory TodoItemDto({
    @required String id,
    @required String name,
    @required bool done,
  }) = _TodoItemDto;

  //Converting todoItem to a DTO
  factory TodoItemDto.fromDomain(TodoItem todoItem) {
    return TodoItemDto(
     id: todoItem.uniqueId.getOrCrash(),
     name: todoItem.name.getOrCrash(),
     done: todoItem.done,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      uniqueId: UniqueId.fromUniqueString(id.toString()),
      name: TodoName(name),
      done: done,
    );
  }

  factory TodoItemDto.fromJson(Map<String, dynamic> json) => _$TodoItemDtoFromJson(json);
}