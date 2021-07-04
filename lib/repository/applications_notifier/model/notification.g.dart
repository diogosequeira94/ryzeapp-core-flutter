// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel(
    notificationType: json['notificationType'] as String,
    posterId: json['posterId'] as String,
    applierName: json['applierName'] as String,
    applierDescription: json['applierDescription'] as String,
    applierPhoneNumber: json['applierPhoneNumber'] as String,
    applierId: json['applierId'] as String,
    jobTitle: json['jobTitle'] as String,
    jobId: json['jobId'] as String,
  );
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'posterId': instance.posterId,
      'applierName': instance.applierName,
      'applierId': instance.applierId,
      'applierDescription': instance.applierDescription,
      'applierPhoneNumber': instance.applierPhoneNumber,
      'jobTitle': instance.jobTitle,
      'jobId': instance.jobId,
    };
