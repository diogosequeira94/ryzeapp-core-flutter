part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();
}

class FetchJobsPosts extends JobsEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class AddJobPost extends JobsEvent {
  final File jobPostImage;
  final JobPost jobPost;
  AddJobPost(this.jobPost, this.jobPostImage);
  @override
  List<Object> get props => [jobPost, jobPostImage];
}

class JobApplyPressed extends JobsEvent {
  final JobPost jobPost;
  JobApplyPressed(this.jobPost);
  @override
  List<Object> get props => [jobPost];
}

class DeleteJobPost extends JobsEvent {
  final JobPost jobPost;
  DeleteJobPost(this.jobPost);
  @override
  List<Object> get props => [jobPost];
}
