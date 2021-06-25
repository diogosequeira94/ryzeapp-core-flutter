// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_and_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateAndTime _$DateAndTimeFromJson(Map<String, dynamic> json) {
  return DateAndTime(
    date: json['date'] as String,
    time: json['time'] as String,
  );
}

Map<String, dynamic> _$DateAndTimeToJson(DateAndTime instance) =>
    <String, dynamic>{
      'date': instance.date,
      'time': instance.time,
    };
