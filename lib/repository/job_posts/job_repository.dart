import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/job_posts/error/job_post_failure.dart';
import 'package:firebaseblocryze/repository/job_posts/i_job_post_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IJobPostRepository)
class JobRepository implements IJobPostRepository {
  final Firestore _fireStore;

  JobRepository(this._fireStore);

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
  Future<Either<JobPostFailure, void>> delete(JobPost jobPost) {
    // TODO: implement delete
    throw UnimplementedError();
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
}
