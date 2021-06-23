import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:firebaseblocryze/repository/user/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserProfile userProfile;

  UserBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserProfileFetched) {
      yield* _mapUserProfileFetchedToState(event);
    } else if (event is UserProfileSavePressed) {
      yield* _mapUserProfileSavePressedToState(event);
    }
  }

  Stream<UserState> _mapUserProfileFetchedToState(
      UserProfileFetched event) async* {
    if (event.userId == null) {
      yield UserLoadFailure(errorMessage: 'Null ID');
      return;
    }
    yield UserLoadInProgress();
    print('######### GETTING THE PROFILE.... INSIDE BLOC');

    try {
      userProfile =
          await userRepository.getUserProfileInfo(userId: event.userId);
    } on Exception {
      yield UserLoadFailure(errorMessage: 'FAIL');
      return;
    }

    if (userProfile == null) {
      yield UserLoadFailure(errorMessage: 'EMPTY OBJECT');
      return;
    }

    print(
        '######### User Profile Data in BLoc: ${userProfile.toJson().toString()}');
    yield UserLoadSuccess(userProfile: userProfile);
  }

  Stream<UserState> _mapUserProfileSavePressedToState(
      UserProfileSavePressed event) async* {
    yield UserProfileEditInProgress();
    try {
      final userProfileImageUrl =
          await userRepository.uploadProfileImage(event.profileImage);
      await userRepository.updateUserProfile(
          userId: event.userId,
          userProfile:
              event.userProfile.copyWith(profilePicUrl: userProfileImageUrl));
    } on Exception {
      yield UserProfileEditFailure(errorMessage: 'FAIL');
      return;
    }

    if (userProfile == null) {
      yield UserProfileEditFailure(errorMessage: 'EMPTY OBJECT');
      return;
    }

    print('######### User Profile Updated: ${userProfile.toJson().toString()}');
    yield UserProfileEditSuccess();
  }
}
