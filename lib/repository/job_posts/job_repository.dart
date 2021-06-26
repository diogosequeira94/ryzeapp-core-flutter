import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/repository/job_posts/error/job_post_failure.dart';
import 'package:firebaseblocryze/repository/job_posts/i_job_post_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@LazySingleton(as: IJobPostRepository)
class JobRepository implements IJobPostRepository {
  final Firestore _fireStore;
  final FirebaseStorage _firebaseStorage;

  JobRepository(this._fireStore, this._firebaseStorage);

  @override
  Future<Either<JobPostFailure, void>> create(JobPost jobPost) async {
    try {
      return Right(_fireStore.collection('jobs').add(jobPost.toJson()));
    } on Exception {
      return Left(JobPostFailure.unexpected());
    }
  }

  @override
  Future<Either<JobPostFailure, void>> delete(JobPost jobPost) async {
    try {
      return Right(_fireStore
          .collection('jobs')
          .where('jobID', isEqualTo: jobPost.jobID)
          .getDocuments()
          .then((value) {
        value.documents.forEach((element) {
          _fireStore.collection('jobs').document(element.documentID).delete();
        });
      }));
    } on Exception {
      return Left(JobPostFailure.unexpected());
    }
  }

  @override
  Future<Either<JobPostFailure, List<JobPost>>> getJobs() async {
    try {
      final jobsList = await _fireStore.collection('jobs').getDocuments().then(
          (snapshot) =>
              snapshot.documents.map((e) => JobPost.fromJson(e.data)).toList());
      return Right(jobsList);
    } on Exception {
      return Left(const JobPostFailure.unexpected());
    }
  }

  @override
  Future<Either<JobPostFailure, void>> update(JobPost jobPost) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<Either<JobPostFailure, String>> uploadJobImage(File _image) async {
    if (_image != null) {
      try {
        final storageReference =
            _firebaseStorage.ref().child('jobImages/${basename(_image.path)}');
        final uploadTask = storageReference.putFile(_image);
        await uploadTask.onComplete;
        String returnURL;
        await storageReference.getDownloadURL().then((fileURL) {
          returnURL = fileURL;
        });
        return Right(returnURL);
      } on PlatformException catch (e) {
        if (e.code == 'DATA_LOSS') {
          return Left(const JobPostFailure.dataCorrupted());
        } else {
          return Left(const JobPostFailure.unexpected());
        }
      }
    }
    return null;
  }

  @override
  Future<Either<JobPostFailure, void>> submitJobApplication(
      JobPost jobPost) async {
    try {
      // We are only updating a value here, but the purpose is to create a new application to that job with the user info,
      // and also send 2 notifications
      return Right(_fireStore
          .collection('jobs')
          .document(jobPost.jobID)
          .setData(jobPost
              .copyWith(currentProposals: jobPost.currentProposals + 1)
              .toJson()));
    } on Exception {
      return Left(JobPostFailure.unexpected());
    }
  }
}
