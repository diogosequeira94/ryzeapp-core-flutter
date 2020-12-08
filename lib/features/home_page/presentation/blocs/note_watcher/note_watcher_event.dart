part of 'note_watcher_bloc.dart';

@freezed
abstract class NoteWatcherEvent with _$NoteWatcherEvent {
  const factory NoteWatcherEvent.watchAllStarted() = _WatchAllStarted;
  const factory NoteWatcherEvent.watchUncompletedStated() =
      _WatchUncompletedStarted;
  const factory NoteWatcherEvent.notesReceived(
    Either<NoteFailure, List<Note>> failureOrNotes,
  ) = _NotesReceived;
}
