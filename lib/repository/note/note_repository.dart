import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseblocryze/repository/note/dto/note_dto.dart';
import 'package:firebaseblocryze/repository/note/models/note.dart';
import 'package:firebaseblocryze/repository/note/error/note_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'i_note_repository.dart';
import 'package:firebaseblocryze/features/login_feature/infrastructure/core/firestore_helpers.dart';

@LazySingleton(as: INoteRepository)
class NoteRepository implements INoteRepository {
  final Firestore _firestore;

  NoteRepository(this._firestore);
  @override
  Stream<Either<NoteFailure, List<Note>>> watchAll() async* {
    // users/{user ID}/notes/{noteID}
    // We need to get the User ID from the firebase_auth_facade
    final userDoc = await _firestore.userDocument();
    // userDoc.noteCollection.getDocuments(); -> Would get every documents at once
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map((snapshot) => right(
              snapshot.documents
                  .map((doc) => NoteDto.fromFirestore(doc).toDomain())
                  .toList(),
            ))
        .handleError((e) {
      if (e is PlatformException && e.message.contains('PERMISSION_DENIED')) {
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
    final userDoc = await _firestore.userDocument();
    // userDoc.noteCollection.getDocuments(); -> Would get every documents at once
    yield* userDoc.noteCollection
        .orderBy('serverTimeStamp', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.documents
              .map((doc) => NoteDto.fromFirestore(doc).toDomain()),
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
  Future<Either<NoteFailure, void>> create(Note note) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, void>> delete(Note note) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, void>> update(Note note) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
