import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'error/job_post_failure.dart';

abstract class IJobPostRepository {
  // watch jobs
  // watch available jobs
  // Create Update Delete
  Future<Either<JobPostFailure, List<JobPost>>> getJobs();
  Future<Either<JobPostFailure, void>> create(JobPost jobPost);
  Future<Either<JobPostFailure, void>> update(JobPost jobPost);
  Future<Either<JobPostFailure, void>> delete(JobPost jobPost);
}