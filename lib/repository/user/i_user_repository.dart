// ignore: one_member_abstracts
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:meta/meta.dart';

abstract class IUserRepository {
  Future<UserProfile> getUserProfileInfo({@required String userId});
  Future<void> updateUserProfile({@required UserProfile userProfile});
}
