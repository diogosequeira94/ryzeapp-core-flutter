import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/repository/job_posts/job_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final AuthBloc _authBloc;
  final JobRepository _jobRepository;
  JobsBloc(this._jobRepository, this._authBloc) : super(JobsInitial());

  @override
  Stream<JobsState> mapEventToState(
    JobsEvent event,
  ) async* {
    if (event is FetchJobsPosts) {
      yield JobsFetchInProgress();
      final jobsList = await _jobRepository.getJobs();
      yield* jobsList.fold(
        (failure) async* {
          yield JobsFetchFailure('Failure getting list');
        },
        (jobs) async* {
          final userId = _authBloc.userId;
          print('user ID: $userId');
          final userJobs =
              jobs.where((element) => element.posterID == userId).toList();
          yield JobsFetchSuccess(jobsList: jobs, myJobs: userJobs);
        },
      );
    } else if (event is AddJobPost) {
      yield AddJobInProgress();
      final jobPostImageUrl =
          await _jobRepository.uploadJobImage(event.jobPostImage);
      final imageUrl = jobPostImageUrl == null
          ? null
          : jobPostImageUrl.fold((failure) {
              AddJobFailure('Failed uploading image');
              return;
            }, (url) => url);
      final result = await _jobRepository
          .create(event.jobPost.copyWith(imageUrl: imageUrl));
      yield result.fold(
        (failure) => AddJobFailure('Failed creating job.'),
        (success) => AddJobSuccess(),
      );
      add(FetchJobsPosts());
    } else if (event is DeleteJobPost) {
      yield DeleteJobInProgress();
      final result = await _jobRepository.delete(event.jobPost);
      yield result.fold(
        (failure) => DeleteJobFailure('Failed deleting job.'),
        (success) => DeleteJobSuccess(),
      );
    }
  }
}
