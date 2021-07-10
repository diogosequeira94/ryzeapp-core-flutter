part of 'jobs_fetcher_cubit.dart';

abstract class JobsFetcherState extends Equatable {
  const JobsFetcherState();
}

class JobsFetcherInitial extends JobsFetcherState {
  @override
  List<Object> get props => [];
}

class FetchSingleJobInProgress extends JobsFetcherState {
  FetchSingleJobInProgress();
  @override
  List<Object> get props => [];
}

class FetchSingleJobEmpty extends JobsFetcherState {
  FetchSingleJobEmpty();
  @override
  List<Object> get props => [];
}

class FetchSingleJobSuccess extends JobsFetcherState {
  final JobPost job;
  FetchSingleJobSuccess({@required this.job});
  @override
  List<Object> get props => [job];
}

class FetchSingleJobFailure extends JobsFetcherState {
  final String message;
  FetchSingleJobFailure(this.message);
  @override
  List<Object> get props => [message];
}
