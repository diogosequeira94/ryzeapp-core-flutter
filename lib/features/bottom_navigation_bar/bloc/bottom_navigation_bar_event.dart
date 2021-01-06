part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();
}

class BottomNavigationHomePagePressed extends BottomNavigationBarEvent {
  @override
  List<Object> get props => [];
}

class BottomNavigationExplorePagePressed extends BottomNavigationBarEvent {
  @override
  List<Object> get props => [];
}

class BottomNavigationExploreMapPressed extends BottomNavigationBarEvent {
  @override
  List<Object> get props => [];
}

class BottomNavigationAccountPagePressed extends BottomNavigationBarEvent {
  @override
  List<Object> get props => [];
}

