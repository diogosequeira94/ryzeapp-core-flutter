import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:firebaseblocryze/repository/user/user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preview_state.dart';

class UserPreviewCubit extends Cubit<UserPreviewState> {
  final UserRepository userRepository;
  UserPreviewCubit(this.userRepository) : super(UserPreviewInitial());

  Future fetchUserProfilePreview(String userId) async {
    UserProfile userProfile;
    if (userId == null) {
      emit(UserProfilePreviewFailure(errorMessage: 'Null ID'));
      return null;
    }
    emit(UserProfilePreviewInProgress());
    try {
      userProfile = await userRepository.getUserProfileInfo(userId: userId);
    } on Exception {
      emit(UserProfilePreviewFailure(errorMessage: 'FAIL'));
      return null;
    }

    if (userProfile == null) {
      emit(UserProfilePreviewFailure(errorMessage: 'EMPTY OBJECT'));
      return null;
    }

    print(
        '######### User Profile Data in BLoc: ${userProfile.toJson().toString()}');
    emit(UserProfilePreviewSuccess(userProfile: userProfile));
  }
}
