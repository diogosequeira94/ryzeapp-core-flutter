import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/note/error/note_failure.dart';
import 'package:firebaseblocryze/repository/note/i_note_repository.dart';
import 'package:firebaseblocryze/repository/note/models/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'note_watcher_event.dart';
part 'note_watcher_state.dart';
part 'note_watcher_bloc.freezed.dart';

@injectable
class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  final INoteRepository _noteRepository;

  NoteWatcherBloc(this._noteRepository)
      : super(const NoteWatcherState.initial());

  StreamSubscription<Either<NoteFailure, List<Note>>> _noteStreamSubscription;


  @override
  Stream<NoteWatcherState> mapEventToState(
    NoteWatcherEvent event,
  ) async* {
    yield* event.map(
      watchAllStarted: (e) async* {
        yield const NoteWatcherState.loadInProgress();
        await _noteStreamSubscription?.cancel();
        /// If we yield each , As long as we have the note screen open, the repo it will never stop sending us events
        _noteStreamSubscription = _noteRepository.watchAll().listen((failureOrNotes) => add(NoteWatcherEvent.notesReceived(failureOrNotes)));
      },
      watchUncompletedStated: (e) async* {
        yield const NoteWatcherState.loadInProgress();
        await _noteStreamSubscription?.cancel();
        /// If we yield each , As long as we have the note screen open, the repo it will never stop sending us events
        _noteStreamSubscription = _noteRepository.watchUncompleted().listen((failureOrNotes) => add(NoteWatcherEvent.notesReceived(failureOrNotes)));
      },
      notesReceived: (e) async* {
        yield e.failureOrNotes.fold(
            (failure) => NoteWatcherState.loadFailure(failure),
            (notes) => NoteWatcherState.loadSuccess(notes),
        );
      },
    );
  }

  /// Preventing memory leaks
  @override
  Future<void> close() async {
    await _noteStreamSubscription?.cancel();
    return super.close();
  }
}
