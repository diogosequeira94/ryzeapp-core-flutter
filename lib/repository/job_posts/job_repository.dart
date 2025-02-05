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
  final FirebaseFirestore _fireStore;
  final FirebaseStorage _firebaseStorage;

  JobRepository(this._fireStore, this._firebaseStorage);

  @override
  Future<Either<JobPostFailure, void>> create(JobPost jobPost) async {
    /// This way we are creating a new Document with a custom jobID
    try {
      return Right(_fireStore
          .collection('jobs')
          .doc('${jobPost.jobID}')
          .set(jobPost.toJson()));
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
          .get()
          .then((value) {
        value.docs.forEach((element) {
          _fireStore.collection('jobs').doc(element.id).delete();
        });
      }));
    } on Exception {
      return Left(JobPostFailure.unexpected());
    }
  }

  @override
  Future<Either<JobPostFailure, List<JobPost>>> getJobs() async {
    try {
      final jobsList = await _fireStore.collection('jobs').get().then(
          (snapshot) =>
              snapshot.docs.map((e) => JobPost.fromJson(e.data())).toList());
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
        await storageReference.putFile(_image);
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
      JobPost jobPost, String userId) async {
    print('### UPDATING JOB POST ID: ${jobPost.jobID}');
    try {
      // We are only updating a value here, but the purpose is to create a new application to that job with the user info,
      // and also send 2 notifications
      List currentProposals = jobPost.currentProposals;
      currentProposals.add(userId);
      return Right(_fireStore.collection('jobs').doc(jobPost.jobID).update(
          {'currentProposals': FieldValue.arrayUnion(currentProposals)}));
    } on Exception {
      return Left(JobPostFailure.unexpected());
    }
  }

  @override
  Future<Either<JobPostFailure, JobPost>> getJobById(String jobID) async {
    try {

      final job = await _fireStore.collection('jobs').doc(jobID).get().then((document) {
        if (document.exists) {
          return JobPost.fromJson(document.data());
        }
      });
      return Right(job);
    } on Exception {
      return Left(JobPostFailure.unexpected());
    }
  }
}
