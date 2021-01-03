import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  int currentIndex = 0;

  BottomNavigationBarBloc()
      : super(BottomNavigationBarInitial());

  @override
  Stream<BottomNavigationBarState> mapEventToState(
    BottomNavigationBarEvent event,
  ) async* {
    if (event is BottomNavigationHomePagePressed) {
      yield BottomNavigationHomePageLoading();
      yield BottomNavigationHomePageLoaded();
    }

    if (event is BottomNavigationProfilePagePressed) {
      yield BottomNavigationProfilePageLoading();
      //await profilePageRepository.fetchData();
      yield BottomNavigationProfilePageLoaded();
    }

    if (event is BottomNavigationAccountPagePressed) {
      yield BottomNavigationAccountPageLoading();
      //await profilePageRepository.fetchData();
      yield BottomNavigationAccountPageLoaded();
    }
  }
}
