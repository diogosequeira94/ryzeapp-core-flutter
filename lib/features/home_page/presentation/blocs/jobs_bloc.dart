import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/applications_notifier/applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/application.dart';
import 'package:meta/meta.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/repository/job_posts/job_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final AuthBloc authBloc;
  final JobRepository jobRepository;
  final ApplicationsNotifierRepository applicationsNotifierRepository;
  JobsBloc(
      {@required this.jobRepository,
      @required this.authBloc,
      @required this.applicationsNotifierRepository})
      : super(JobsInitial());

  Future<bool> _getLoadingBool() {
    return Future.delayed(Duration(milliseconds: 1000)).then((onValue) => true);
  }

  @override
  Stream<JobsState> mapEventToState(
    JobsEvent event,
  ) async* {
    if (event is FetchJobsPosts) {
      yield JobsFetchInProgress();
      final jobsList = await jobRepository.getJobs();
      yield* jobsList.fold(
        (failure) async* {
          yield JobsFetchFailure('Failure getting list');
        },
        (jobs) async* {
          final userId = authBloc.userId;
          print('user ID: $userId');
          final userJobs =
              jobs.where((element) => element.posterID == userId).toList();
          yield JobsFetchSuccess(jobsList: jobs, myJobs: userJobs);
        },
      );
    } else if (event is AddJobPost) {
      yield AddJobInProgress();
      final jobPostImageUrl =
          await jobRepository.uploadJobImage(event.jobPostImage);
      final imageUrl = jobPostImageUrl == null
          ? null
          : jobPostImageUrl.fold((failure) {
              AddJobFailure('Failed uploading image');
              return;
            }, (url) => url);
      final result = await jobRepository
          .create(event.jobPost.copyWith(imageUrl: imageUrl));
      yield result.fold(
        (failure) => AddJobFailure('Failed creating job.'),
        (success) => AddJobSuccess(),
      );
      add(FetchJobsPosts());
    } else if (event is DeleteJobPost) {
      yield DeleteJobInProgress();
      final result = await jobRepository.delete(event.jobPost);
      yield result.fold(
        (failure) => DeleteJobFailure('Failed deleting job.'),
        (success) => DeleteJobSuccess(),
      );
    } else if (event is JobApplyPressed) {
      yield JobApplicationInProgress();
      await _getLoadingBool();

      final userId = authBloc.userId;
      final dateTimeStamp = DateTime.now().toIso8601String();

      final application = Application(
        userName: event.userName,
        userId: userId,
        dateOfAppliance: dateTimeStamp,
        accepted: false,
      );

      // Creates [Application] under applications sub collection
      await applicationsNotifierRepository.submitJobApplication(
        jobPostId: event.jobPost.jobID,
        jobApplication: application,
      );

      // Creates [Notification] under Job Posters [NotificationCenter]
      await applicationsNotifierRepository.createInAppNotification(
        jobPost: event.jobPost,
        userId: userId,
        posterId: event.jobPost.posterID,
      );

      // Increments [ApplicationCounter] under job details
      final incrementApplicationCounter =
          await jobRepository.submitJobApplication(event.jobPost);
      yield incrementApplicationCounter.fold(
        (failure) =>
            JobApplicationFailure('Oops, something wrong happened. Try again.'),
        (success) => JobApplicationSuccess(),
      );
    }
  }
}
