import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/features/home_page/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:firebaseblocryze/repository/note/error/note_failure.dart';
import 'package:firebaseblocryze/repository/note/i_note_repository.dart';
import 'package:firebaseblocryze/repository/note/models/note.dart';
import 'package:firebaseblocryze/repository/note/value_objects/notes_segment_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';

part 'note_form_bloc.freezed.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;
  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial());

  @override
  Stream<NoteFormState> mapEventToState(
    NoteFormEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.existingInitialNote.fold(
          () => this.state,
          (note) => state.copyWith(
            note: note,
            isEditing: true,
          ),
        );
      },
      bodyChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(body: NoteBody(e.bodyString)),
          saveFailureOrSuccess: none(),
        );
      },
      colorChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(color: NoteColor(e.color)),
          saveFailureOrSuccess: none(),
        );
      },
      todosChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(
              toDos:
                  List3(e.todoList.map((primitive) => primitive.toDomain()))),
          saveFailureOrSuccess: none(),
        );
      },
      saved: (e) async* {
        Either<NoteFailure, Unit> failureOrSuccess;

        yield state.copyWith(
          isSaving: true,
          saveFailureOrSuccess: none(),
        );

        state.isEditing
            ? await _noteRepository.update(state.note)
            : await _noteRepository.create(state.note);

        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccess: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
