// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel(
    posterId: json['posterId'] as String,
    applierName: json['applierName'] as String,
    applierId: json['applierId'] as String,
    jobTitle: json['jobTitle'] as String,
    jobId: json['jobId'] as String,
  );
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'posterId': instance.posterId,
      'applierName': instance.applierName,
      'applierId': instance.applierId,
      'jobTitle': instance.jobTitle,
      'jobId': instance.jobId,
    };
