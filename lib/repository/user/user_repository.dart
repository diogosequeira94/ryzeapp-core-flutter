import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/repository/user/i_user_repository.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class UserRepository extends IUserRepository {
  final FirebaseFirestore fireStore;
  final FirebaseStorage firebaseStorage;
  UserRepository({this.fireStore, this.firebaseStorage});

  @override
  Future<UserProfile> getUserProfileInfo({String userId}) async {
    try {
      var userProfile;
      final userCollection = fireStore.collection('users');
      await userCollection.doc(userId).get().then((document) {
        if (document.exists) {
          userProfile = document.data();
        } else {
          // Throw Failure
          return null;
        }
      });
      return UserProfile.fromJson(userProfile);
    } on Exception {
      return null;
    }
  }

  @override
  Future updateUserProfile({String userId, UserProfile userProfile}) {
    return fireStore.collection('users').doc(userId).set(userProfile.toJson());
  }

  Future<String> uploadProfileImage(File _image) async {
    if (_image != null) {
      try {
        final storageReference = firebaseStorage
            .ref()
            .child('profileImages/${basename(_image.path)}');
        await storageReference.putFile(_image);
        String returnURL;
        await storageReference.getDownloadURL().then((fileURL) {
          returnURL = fileURL;
        });
        return returnURL;
      } on PlatformException catch (e) {
        if (e.code == 'DATA_LOSS') {
          return 'DATA FAILED';
        } else {
          return 'UNEXPECTED ERROR';
        }
      }
    }
    return null;
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
