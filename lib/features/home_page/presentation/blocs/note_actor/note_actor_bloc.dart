import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebaseblocryze/repository/note/error/note_failure.dart';
import 'package:firebaseblocryze/repository/note/i_note_repository.dart';
import 'package:firebaseblocryze/repository/note/models/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';
part 'note_actor_bloc.freezed.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;
  NoteActorBloc(this._noteRepository) : super(NoteActorState.initial());

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    yield const NoteActorState.actionInProgress();
    final result = await _noteRepository.delete(event.note);
    yield result.fold(
            (failure) => NoteActorState.deleteFailure(failure),
            (success) => const NoteActorState.deleteSuccess(),
    );
  }
}
