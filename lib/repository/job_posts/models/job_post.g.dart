// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobPost _$JobPostFromJson(Map<String, dynamic> json) {
  return JobPost(
    id: json['id'] as String,
    description: json['description'] as String,
    hourPay: (json['hourPay'] as num).toDouble(),
    availableSlots: json['availableSlots'] as int,
    location: json['location'] as String,
    available: json['available'] as bool,
    creationDate: DateTime.parse(json['creationDate'] as String),
    expireDate: DateTime.parse(json['expireDate'] as String),
  );
}

Map<String, dynamic> _$JobPostToJson(JobPost instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'hourPay': instance.hourPay,
      'availableSlots': instance.availableSlots,
      'location': instance.location,
      'available': instance.available,
      'creationDate': instance.creationDate.toIso8601String(),
      'expireDate': instance.expireDate.toIso8601String(),
    };
