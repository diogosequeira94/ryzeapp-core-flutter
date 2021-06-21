import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserProfileFetched extends UserEvent {
  final String userId;
  const UserProfileFetched({this.userId});
  @override
  List<Object> get props => [userId];
}

class UserProfileSavePressed extends UserEvent {
  final File profileImage;
  final String userId;
  final UserProfile userProfile;
  const UserProfileSavePressed(
      {this.profileImage, this.userId, this.userProfile});
  @override
  List<Object> get props => [userProfile, userId, profileImage];
}
