import 'package:firebaseblocryze/features/home_page/domain/notes/notes_value_objects.dart';
import 'package:firebaseblocryze/features/home_page/domain/notes/todo_item.dart';
import 'package:firebaseblocryze/features/login_feature/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';

/// Freezed Note data class.
/// UniqueId is not feature specific
/// It will be always present in any entity we create.

@freezed
abstract class Note with _$Note {
  const factory Note({
    @required UniqueId id,
    @required NoteBody body,
    @required NoteColor color,
    @required List3<TodoItem> toDos,
  }) = _Note;

  //This is the default empty note present when we open note form first time.
  factory Note.empty() => Note(
    id: UniqueId(),
    body: NoteBody(''),
    color: NoteColor(NoteColor.predefinedColors[0]),
    toDos: List3([]),
  );
}
