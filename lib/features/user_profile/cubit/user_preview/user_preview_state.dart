part of 'user_preview_cubit.dart';

abstract class UserPreviewState extends Equatable {
  const UserPreviewState();
}

class UserPreviewInitial extends UserPreviewState {
  @override
  List<Object> get props => [];
}

class UserProfilePreviewInProgress extends UserPreviewState {
  @override
  List<Object> get props => [];
}

class UserProfilePreviewSuccess extends UserPreviewState {
  final UserProfile userProfile;

  const UserProfilePreviewSuccess({
    @required this.userProfile,
  });

  @override
  List<Object> get props => [
    userProfile,
  ];
}

class UserProfilePreviewFailure extends UserPreviewState {
  final String errorMessage;

  UserProfilePreviewFailure({@required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
