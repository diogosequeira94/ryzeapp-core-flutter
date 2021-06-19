import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:meta/meta.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoadInProgress extends UserState {}

class UserLoadSuccess extends UserState {
  final UserProfile userProfile;

  const UserLoadSuccess({
    @required this.userProfile,
  });

  @override
  List<Object> get props => [
        userProfile,
      ];
}

class UserLoadFailure extends UserState {
  final String errorMessage;

  UserLoadFailure({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

class UserNotImplementedFailure extends UserState {}
