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
    payTerms: json['payTerms'] as String,
    category: json['category'] as String,
    hourRate: json['hourRate'] as String,
    startDate: json['startDate'] as String,
    startTime: json['startTime'] as String,
    endDate: json['endDate'] as String,
    endTime: json['endTime'] as String,
    additionalInfo: json['additionalInfo'] as String,
    isRemote: json['isRemote'] as bool,
    slotsAvailable: json['slotsAvailable'] as int,
    maxCandidates: json['maxCandidates'] as int,
    currentProposals:
        (json['currentProposals'] as List)?.map((e) => e as String)?.toList(),
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
      'payTerms': instance.payTerms,
      'category': instance.category,
      'startDate': instance.startDate,
      'startTime': instance.startTime,
      'endDate': instance.endDate,
      'endTime': instance.endTime,
      'hourRate': instance.hourRate,
      'isRemote': instance.isRemote,
      'additionalInfo': instance.additionalInfo,
      'slotsAvailable': instance.slotsAvailable,
      'maxCandidates': instance.maxCandidates,
      'currentProposals': instance.currentProposals,
      'languages': instance.languages,
    };
