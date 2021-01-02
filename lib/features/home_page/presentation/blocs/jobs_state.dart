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
  final List<JobPost> list;
  JobsFetchSuccess(this.list);
  @override
  List<Object> get props => [list];
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
