// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedJob _$AppliedJobFromJson(Map<String, dynamic> json) {
  return AppliedJob(
    jobTitle: json['jobTitle'] as String,
    dateOfApplication: json['dateOfApplication'] as String,
    accepted: json['accepted'] as bool,
  );
}

Map<String, dynamic> _$AppliedJobToJson(AppliedJob instance) =>
    <String, dynamic>{
      'jobTitle': instance.jobTitle,
      'dateOfApplication': instance.dateOfApplication,
      'accepted': instance.accepted,
    };
