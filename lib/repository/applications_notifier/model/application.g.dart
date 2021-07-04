// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    userName: json['userName'] as String,
    userDescription: json['userDescription'] as String,
    userPhoneNumber: json['userPhoneNumber'] as String,
    userId: json['userId'] as String,
    dateOfAppliance: json['dateOfAppliance'] as String,
    accepted: json['accepted'] as bool,
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userDescription': instance.userDescription,
      'userPhoneNumber': instance.userPhoneNumber,
      'dateOfAppliance': instance.dateOfAppliance,
      'accepted': instance.accepted,
    };
