import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:firebaseblocryze/repository/user/user_repository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserProfile _userProfile;

  UserBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserProfileFetched) {
      yield* _mapWarrantyPlansFetchedToState(event);
    }
  }

  Stream<UserState> _mapWarrantyPlansFetchedToState(
      UserProfileFetched event) async* {
    if (event.userId == null) {
      yield UserLoadFailure(errorMessage: 'Null ID');
      return;
    }


    yield UserLoadInProgress();
    print('######### GETTING THE PROFILE.... INSIDE BLOC');

    try {
      _userProfile =
          await userRepository.getUserProfileInfo(userId: event.userId);
    } on Exception {
      yield UserLoadFailure(errorMessage: 'FAIL');
      return;
    }

    if (_userProfile == null) {
      yield UserLoadFailure(errorMessage: 'EMPTY OBJECT');
      return;
    }

    print('######### User Profile Data in BLoc: ${_userProfile.toJson().toString()}');
    yield UserLoadSuccess(userProfile: _userProfile);
  }
}
