import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/job_posts/job_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jobs_fetcher_state.dart';

class JobsFetcherCubit extends Cubit<JobsFetcherState> {
  final JobRepository jobRepository;
  JobsFetcherCubit(this.jobRepository) : super(JobsFetcherInitial());

  Future fetchSingleJob(String jobId) async {
    var jobPost;
    emit(FetchSingleJobInProgress());
    try {
      jobPost = await jobRepository.getJobById(jobId);
    } on Exception {
      emit(FetchSingleJobFailure('FAIL'));
      return null;
    }

    if (jobPost == null) {
      emit(FetchSingleJobFailure('EMPTY OBJECT'));
      return null;
    }

    print('######### Job Data in Cubit: ${jobPost.toJson().toString()}');
    emit(FetchSingleJobSuccess(job: jobPost));
  }
}
