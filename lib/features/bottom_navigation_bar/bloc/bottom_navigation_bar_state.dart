part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();
}

class BottomNavigationBarInitial extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationHomePageLoading extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationHomePageLoadingFailure extends BottomNavigationBarState {
  final String error;
  const BottomNavigationHomePageLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}

class BottomNavigationHomePageLoaded extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationExplorePageLoading extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationExplorePageLoadingFailure
    extends BottomNavigationBarState {
  final String error;
  const BottomNavigationExplorePageLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}

class BottomNavigationJobsHubPageLoaded extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationJobsHubPageLoading extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationJobsHubPageLoadingFailure
    extends BottomNavigationBarState {
  final String error;
  const BottomNavigationJobsHubPageLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}

class BottomNavigationExplorePageLoaded extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationAccountPageLoading extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationAccountPageLoadingFailure
    extends BottomNavigationBarState {
  final String error;
  const BottomNavigationAccountPageLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}

class BottomNavigationAccountPageLoaded extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationExploreMapLoading extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationExploreMapLoaded extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}
