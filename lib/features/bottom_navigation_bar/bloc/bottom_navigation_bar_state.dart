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

class BottomNavigationProfilePageLoading extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationProfilePageLoadingFailure extends BottomNavigationBarState {
  final String error;
  const BottomNavigationProfilePageLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}

class BottomNavigationProfilePageLoaded extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}
