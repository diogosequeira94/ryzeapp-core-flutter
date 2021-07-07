import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  int currentIndex = 0;

  BottomNavigationBarBloc() : super(BottomNavigationBarInitial());

  @override
  Stream<BottomNavigationBarState> mapEventToState(
    BottomNavigationBarEvent event,
  ) async* {
    if (event is BottomNavigationHomePagePressed) {
      yield BottomNavigationHomePageLoading();
      yield BottomNavigationHomePageLoaded();
    } else if (event is BottomNavigationExplorePagePressed) {
      yield BottomNavigationExplorePageLoading();
      yield BottomNavigationExplorePageLoaded();
    } else if (event is BottomNavigationExploreMapPressed) {
      yield BottomNavigationExploreMapLoading();
      yield BottomNavigationExploreMapLoaded();
    } else if (event is BottomNavigationJobsHubPressed) {
      yield BottomNavigationJobsHubPageLoading();
      yield BottomNavigationJobsHubPageLoaded();
    } else if (event is BottomNavigationAccountPagePressed) {
      yield BottomNavigationAccountPageLoading();
      yield BottomNavigationAccountPageLoaded();
    }
  }
}
