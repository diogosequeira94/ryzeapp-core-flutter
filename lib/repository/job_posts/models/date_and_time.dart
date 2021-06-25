import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'date_and_time.g.dart';

@JsonSerializable(explicitToJson: true)
class DateAndTime extends Equatable {
  final String date;
  final String time;

  const DateAndTime({
    @required this.date,
    @required this.time,
  });

  @override
  List<Object> get props => [
        date,
        time,
      ];

  factory DateAndTime.fromJson(Map<String, dynamic> json) =>
      _$DateAndTimeFromJson(json);

  Map<String, dynamic> toJson() => _$DateAndTimeToJson(this);
}
