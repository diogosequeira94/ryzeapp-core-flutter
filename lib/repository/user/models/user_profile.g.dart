// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    profilePicUrl: json['profilePicUrl'] as String,
    about: json['about'] as String,
    email: json['email'] as String,
    phoneNumber: json['phoneNumber'] as String,
    dateOfBirth: json['dateOfBirth'] as String,
    city: json['city'] as String,
    isDriver: json['isDriver'] as bool,
    skills: (json['skills'] as List)?.map((e) => e as String)?.toList(),
    education: json['education'] as String,
    jobsCompleted: json['jobsCompleted'] as int,
    noShows: json['noShows'] as int,
    isComplete: json['isComplete'] as bool,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePicUrl': instance.profilePicUrl,
      'about': instance.about,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth,
      'city': instance.city,
      'isDriver': instance.isDriver,
      'skills': instance.skills,
      'education': instance.education,
      'jobsCompleted': instance.jobsCompleted,
      'noShows': instance.noShows,
      'isComplete': instance.isComplete,
    };
