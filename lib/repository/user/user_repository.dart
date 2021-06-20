import 'package:firebaseblocryze/repository/user/i_user_repository.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository extends IUserRepository {
  final Firestore _fireStore;
  UserRepository(this._fireStore);

  @override
  Future<UserProfile> getUserProfileInfo({String userId}) async {
    try {
      var userProfile;
      final userCollection = _fireStore.collection('users');
      print('####### Getting User Profile Data for user $userId');
      final userProfileSnapshot = await userCollection.document(userId).get();

      if (userProfileSnapshot.exists) {
        userProfile = userProfileSnapshot.data;
        print('####### User Profile Data: ${userProfile.toString()}');
      } else {
        // Throw Failure
        return null;
      }
      return UserProfile.fromJson(userProfile);
    } on Exception {
      return null;
    }
  }

  @override
  Future updateUserProfile({String userId, UserProfile userProfile}) {
    return null;
    /*
    _fireStore.collection('users').document(userId).setData({
      userProfile.toJson();
    });
      */
  }

/*
  UserRepositoryError _getBsiException(dynamic exception) {
    if (exception) {
      return UserRepositoryHttpError(exception.statusCode);
    } else if (exception is '123') {
      return UserRepositoryTimeoutError();
    } else if (exception is NoNetworkError) {
      return BsiNoNetworkError();
    } else if (exception is GenericError) {
      return BsiGenericError('Generic OMC error: $exception');
    } else {
      return BsiGenericError('An unknown error occurred: $exception');
    }
  }


  var userPhotos;
  Future<void> getPhoto(id) async {
    //query the user photo
    await FirebaseFirestore.instance.collection("users").doc(id).snapshots().listen((event) {
      setState(() {
        userPhotos = event.get("photoUrl");
        print(userPhotos);
      });
    });
  }
  */

}
