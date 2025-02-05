import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/applications_notifier/applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/applications_notifier/model/application.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:firebaseblocryze/repository/job_posts/job_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobRepository jobRepository;
  final ApplicationsNotifierRepository applicationsNotifierRepository;
  JobsBloc(
      {@required this.jobRepository,
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
          final FirebaseAuth auth = FirebaseAuth.instance;
          final userId = auth.currentUser.uid;
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

      final FirebaseAuth auth = FirebaseAuth.instance;
      final userId = auth.currentUser.uid;
      final dateTimeStamp = DateTime.now().toIso8601String();

      final userName =
          '${event.userProfile.firstName} ${event.userProfile.lastName}';

      final application = Application(
        userName: userName,
        userDescription: event.userProfile.about ?? '',
        userPhoneNumber: event.userProfile.phoneNumber ?? '',
        userId: userId,
        dateOfAppliance: dateTimeStamp,
        accepted: false,
      );

      // Creates [Application] under [Jobs] applications sub collection
      await applicationsNotifierRepository.submitJobApplication(
        jobPostId: event.jobPost.jobID,
        jobApplication: application,
      );

      // Creates [Application] under [Users] applications sub collection
      await applicationsNotifierRepository.addUserJobApplication(
        jobPostId: event.jobPost.jobID,
        jobTitle: event.jobPost.title,
        userId: userId,
      );

      // Creates [Notification] under Job Posters [NotificationCenter]
      await applicationsNotifierRepository.createJobApplicationNotification(
        jobPost: event.jobPost,
        type: NotificationType.application,
        applierName: userName,
        applierDescription: event.userProfile.about ?? '',
        applierPhoneNumber: event.userProfile.phoneNumber ?? '',
        applierId: userId,
        posterId: event.jobPost.posterID,
      );

      // Increments [ApplicationCounter] under job details
      final incrementApplicationCounter =
          await jobRepository.submitJobApplication(event.jobPost, userId);
      yield incrementApplicationCounter.fold(
        (failure) =>
            JobApplicationFailure('Oops, something wrong happened. Try again.'),
        (success) => JobApplicationSuccess(),
      );
    } else if (event is AcceptJobPressed) {
      yield JobAcceptanceInProgress();
      await _getLoadingBool();

      try {
        // Creates [Notification] under Appliers [NotificationCenter]
        await applicationsNotifierRepository.acceptCandidateApplication(
          jobTitle: event.jobTitle,
          jobPostId: event.jobId,
          applierId: event.applierId,
        );
      } on Exception {
        yield JobAcceptanceFailure('FAILURE');
        return;
      }
      yield JobAcceptanceSuccess();
    }
  }
}
