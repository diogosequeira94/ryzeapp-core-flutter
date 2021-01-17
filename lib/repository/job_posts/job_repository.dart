import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/repository/job_posts/error/job_post_failure.dart';
import 'package:firebaseblocryze/repository/job_posts/i_job_post_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/cupertino.dart';
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
       return Right(_fireStore.collection('jobs').add(
          jobPost.toJson()
      ));
    } on Exception {
      return Left(JobPostFailure.unexpected());
    }
  }

  @override
  Future<Either<JobPostFailure, void>> delete(JobPost jobPost) async {
    try {
      return Right(_fireStore.collection('jobs').where('jobID', isEqualTo: jobPost.jobID).getDocuments().then((value) {
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
      final jobsList =
          await _fireStore.collection('jobs').getDocuments().then((snapshot) =>
        snapshot.documents.map((e) => JobPost.fromJson(e.data)).toList()
      );
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
    print('############## STARTED UPLOADING JOB ##############');
    if (_image != null){
      try{
        final storageReference = _firebaseStorage.ref().child('jobImages/${basename(_image.path)}');
        final uploadTask = storageReference.putFile(_image);
        await uploadTask.onComplete;
        print('############## FILE UPLOADED ##############');
        String returnURL;
        await storageReference.getDownloadURL().then((fileURL) {
          returnURL =  fileURL;
          print('############## $fileURL ##############');
        });
        return Right(returnURL);
      } on Exception {
        return Left(const JobPostFailure.unexpected());
      }
    }
    return null;
  }
}
