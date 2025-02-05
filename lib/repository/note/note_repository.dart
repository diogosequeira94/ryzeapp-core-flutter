import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseblocryze/repository/note/dto/note_dto.dart';
import 'package:firebaseblocryze/repository/note/models/note.dart';
import 'package:firebaseblocryze/repository/note/error/note_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'i_note_repository.dart';
import 'package:firebaseblocryze/platform/core_helpers/firestore_helpers.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _fireStore;

  NoteRepository(this._fireStore);
  @override
  Stream<Either<NoteFailure, List<Note>>> watchAll() async* {
    // users/{user ID}/notes/{noteID}
    // We need to get the User ID from the firebase_auth_facade
    final userDoc = await _fireStore.userDocument();
    // userDoc.noteCollection.getDocuments(); -> Would get every documents at once
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map((snapshot) => right(
              snapshot.docs
                  .map((doc) => NoteDto.fromFirestore(doc).toDomain())
                  .toList(),
            ))
        .handleError((e) {
      if (e is FirebaseException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<NoteFailure, List<Note>>> watchUncompleted() async* {
    // users/{user ID}/notes/{noteID}
    // We need to get the User ID from the firebase_auth_facade
    final userDoc = await _fireStore.userDocument();
    // userDoc.noteCollection.getDocuments(); -> Would get every documents at once
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => NoteDto.fromFirestore(doc).toDomain()),
        )
        .map(
          (notes) => right(
            notes
                .where((note) =>
                    note.toDos.getOrCrash().any((todoItem) => !todoItem.done))
                .toList(),
          ),
        )
        .handleError((e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await _fireStore.userDocument();
      // We need to convert the Dart Object to a normal model to send it to FireStore
      final noteDto = NoteDto.fromDomain(note);
      // When set data is call over a non-existing document, it will be created, if it exists, it will be override.
      await userDoc.noteCollection.doc(noteDto.id).set(noteDto.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(NoteFailure.insufficientPermission());
      } else {
        return left(NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await _fireStore.userDocument();
      // We need to convert the Dart Object to a normal model to send it to FireStore
      final noteDto = NoteDto.fromDomain(note);
      // When set data is call over a non-existing document, it will be created, if it exists, it will be override.
      await userDoc.noteCollection.doc(noteDto.id).update(noteDto.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const NoteFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToUpdate());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await _fireStore.userDocument();
      // We need to convert the Dart Object to a normal model to send it to FireStore
      final noteId = note.id.getOrCrash();
      // When set data is call over a non-existing document, it will be created, if it exists, it will be override.
      await userDoc.noteCollection.doc(noteId).delete();
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(NoteFailure.insufficientPermission());
      } else if (e.message.contains('NOT_FOUND')) {
        return left(const NoteFailure.unableToDelete());
      } else {
        return left(NoteFailure.unexpected());
      }
    }
  }
}
