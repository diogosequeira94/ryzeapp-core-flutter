// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    userName: json['userName'] as String,
    userId: json['userId'] as String,
    dateOfAppliance: json['dateOfAppliance'] as String,
    accepted: json['accepted'] as bool,
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
      'dateOfAppliance': instance.dateOfAppliance,
      'accepted': instance.accepted,
    };
