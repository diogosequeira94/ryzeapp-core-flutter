// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPost _$JobPostFromJson(Map<String, dynamic> json) {
  return JobPost(
    title: json['title'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] as String,
    city: json['city'] as String,
    hourRate: json['hourRate'] as String,
    isRemote: json['isRemote'] as bool,
    slotsAvailable: json['slotsAvailable'] as int,
    languages: (json['languages'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$JobPostToJson(JobPost instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'city': instance.city,
      'hourRate': instance.hourRate,
      'isRemote': instance.isRemote,
      'slotsAvailable': instance.slotsAvailable,
      'languages': instance.languages,
    };
