// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPost _$JobPostFromJson(Map<String, dynamic> json) {
  return JobPost(
    jobID: json['jobID'] as String,
    posterName: json['posterName'] as String,
    posterID: json['posterID'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    status: json['status'] as String,
    city: json['city'] as String,
    hourRate: json['hourRate'] as String,
    startDate: json['startDate'] as String,
    endDate: json['endDate'] as String,
    additionalInfo: json['additionalInfo'] as String,
    isRemote: json['isRemote'] as bool,
    slotsAvailable: json['slotsAvailable'] as int,
    maxCandidates: json['maxCandidates'] as int,
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$JobPostToJson(JobPost instance) => <String, dynamic>{
      'jobID': instance.jobID,
      'posterName': instance.posterName,
      'posterID': instance.posterID,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'city': instance.city,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'hourRate': instance.hourRate,
      'isRemote': instance.isRemote,
      'additionalInfo': instance.additionalInfo,
      'slotsAvailable': instance.slotsAvailable,
      'maxCandidates': instance.maxCandidates,
      'languages': instance.languages,
    };
