import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/repositories/home_page_repository.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/repositories/profile_page_repository.dart';
import 'package:flutter/foundation.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  final HomePageRepository homePageRepository;
  final ProfilePageRepository profilePageRepository;
  int currentIndex = 0;

  BottomNavigationBarBloc({
      @required this.homePageRepository,
      @required this.profilePageRepository})
      : super(BottomNavigationBarInitial());

  @override
  Stream<BottomNavigationBarState> mapEventToState(
    BottomNavigationBarEvent event,
  ) async* {
    if (event is BottomNavigationHomePagePressed) {
      yield BottomNavigationHomePageLoading();
      homePageRepository.fetchData();
      yield BottomNavigationHomePageLoaded();
    }

    if (event is BottomNavigationProfilePagePressed) {
      yield BottomNavigationProfilePageLoading();
      profilePageRepository.fetchData();
      yield BottomNavigationProfilePageLoaded();
    }
  }
}
