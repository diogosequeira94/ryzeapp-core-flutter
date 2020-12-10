part of 'note_form_bloc.dart';

@freezed
abstract class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.initialized(Option<Note> existingInitialNote) = _Initialized;
  const factory NoteFormEvent.bodyChanged(String bodyString) = _BodyChanged;
  const factory NoteFormEvent.colorChanged(Color color) = _ColorChanged;
  //Using TodoItemPrimitive has list type because they only have primitive types.
  const factory NoteFormEvent.todosChanged(List<TodoItemPrimitive> todoList) = _TodosChanged;
  const factory NoteFormEvent.saved() = Saved;
}
