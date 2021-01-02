part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();
}

class FetchJobsPosts extends JobsEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AddJobPost extends JobsEvent {
  final JobPost jobPost;
  AddJobPost(this.jobPost);
  @override
  List<Object> get props => [jobPost];
}
