// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return Notification(
    posterId: json['posterId'] as String,
    candidateId: json['candidateId'] as String,
    jobTitle: json['jobTitle'] as String,
    jobId: json['jobId'] as String,
  );
}

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'posterId': instance.posterId,
      'candidateId': instance.candidateId,
      'jobTitle': instance.jobTitle,
      'jobId': instance.jobId,
    };
