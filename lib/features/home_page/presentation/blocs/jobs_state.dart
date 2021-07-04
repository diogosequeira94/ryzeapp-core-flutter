part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();
}

class JobsInitial extends JobsState {
  @override
  List<Object> get props => [];
}

class JobsFetchInProgress extends JobsState {
  JobsFetchInProgress();
  @override
  List<Object> get props => [];
}

class JobsFetchSuccess extends JobsState {
  final List<JobPost> jobsList;
  final List<JobPost> myJobs;
  JobsFetchSuccess({@required this.jobsList, @required this.myJobs});
  @override
  List<Object> get props => [jobsList, myJobs];
}

class JobsFetchFailure extends JobsState {
  final String message;
  JobsFetchFailure(this.message);
  @override
  List<Object> get props => [message];
}

class AddJobInProgress extends JobsState {
  AddJobInProgress();
  @override
  List<Object> get props => [];
}

class AddJobSuccess extends JobsState {
  AddJobSuccess();
  @override
  List<Object> get props => [];
}

class AddJobFailure extends JobsState {
  final String message;
  AddJobFailure(this.message);
  @override
  List<Object> get props => [message];
}

class DeleteJobInProgress extends JobsState {
  DeleteJobInProgress();
  @override
  List<Object> get props => [];
}

class DeleteJobSuccess extends JobsState {
  DeleteJobSuccess();
  @override
  List<Object> get props => [];
}

class DeleteJobFailure extends JobsState {
  final String message;
  DeleteJobFailure(this.message);
  @override
  List<Object> get props => [message];
}

class JobApplicationInProgress extends JobsState {
  JobApplicationInProgress();
  @override
  List<Object> get props => [];
}

class JobApplicationSuccess extends JobsState {
  JobApplicationSuccess();
  @override
  List<Object> get props => [];
}

class JobApplicationFailure extends JobsState {
  final String message;
  JobApplicationFailure(this.message);
  @override
  List<Object> get props => [message];
}

class JobAcceptanceInProgress extends JobsState {
  JobAcceptanceInProgress();
  @override
  List<Object> get props => [];
}

class JobAcceptanceSuccess extends JobsState {
  JobAcceptanceSuccess();
  @override
  List<Object> get props => [];
}

class JobAcceptanceFailure extends JobsState {
  final String message;
  JobAcceptanceFailure(this.message);
  @override
  List<Object> get props => [message];
}
