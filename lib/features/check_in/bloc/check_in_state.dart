part of 'check_in_bloc.dart';

abstract class CheckInState extends Equatable {
  const CheckInState();
}

class CheckInInitial extends CheckInState {
  @override
  List<Object> get props => [];
}
