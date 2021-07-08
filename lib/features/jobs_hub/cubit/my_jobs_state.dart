part of 'my_jobs_cubit.dart';

abstract class MyJobsState extends Equatable {
  const MyJobsState();
}

class MyJobsInitial extends MyJobsState {
  @override
  List<Object> get props => [];
}

class FetchMyApplicationsInProgress extends MyJobsState {
  @override
  List<Object> get props => [];
}

class FetchMyApplicationsSuccess extends MyJobsState {
  final List<AppliedJob> applications;
  FetchMyApplicationsSuccess({@required this.applications});
  @override
  List<Object> get props => [applications];
}

class FetchMyApplicationsFailure extends MyJobsState {
  final String message;
  FetchMyApplicationsFailure(this.message);
  @override
  List<Object> get props => [message];
}
