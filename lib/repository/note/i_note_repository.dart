import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/note/error/note_failure.dart';

import 'models/note.dart';


abstract class INoteRepository {
  // watch notes or jobs
  // watch uncompleted notes
  // Create Update Delete

  Stream<Either<NoteFailure,List<Note>>> watchAll();
  Stream<Either<NoteFailure,List<Note>>> watchUncompleted();
  Future<Either<NoteFailure, void>> create(Note note);
  Future<Either<NoteFailure, void>> update(Note note);
  Future<Either<NoteFailure, void>> delete(Note note);
}