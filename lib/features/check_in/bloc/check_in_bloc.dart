import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_in_event.dart';
part 'check_in_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  CheckInBloc() : super(CheckInInitial());

  @override
  Stream<CheckInState> mapEventToState(
    CheckInEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
