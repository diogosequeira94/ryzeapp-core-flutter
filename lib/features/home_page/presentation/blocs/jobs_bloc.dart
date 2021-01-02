import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/job_posts/job_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  final JobRepository _jobRepository;
  JobsBloc(this._jobRepository) : super(JobsInitial());

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
          yield JobsFetchSuccess(jobs);
        },
      );
    } else if (event is AddJobPost) {
      yield AddJobInProgress();
      final result = await _jobRepository.create(event.jobPost);
      yield result.fold(
        (failure) => AddJobFailure('Failed creating job.'),
        (success) => AddJobSuccess(),
      );
      add(FetchJobsPosts());
    }
  }
}
