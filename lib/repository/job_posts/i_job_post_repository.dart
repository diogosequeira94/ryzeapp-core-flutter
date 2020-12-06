//import 'package:dartz/dartz.dart';
//
//import 'error/job_post_failure.dart';
//
//abstract class IJobPostRepository {
//  // watch jobs
//  // watch available jobs
//  // Create Update Delete
//  Stream<Either<JobPostFailure, List<JobPost>>> watchAll();
//  Stream<Either<JobPostFailure,List<JobPost>>> watchAvailable();
//  Future<Either<JobPostFailure, void>> create(JobPost jobPost);
//  Future<Either<JobPostFailure, void>> update(JobPost jobPost);
//  Future<Either<JobPostFailure, void>> delete(JobPost jobPost);
//}