import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'job_post.g.dart';

@JsonSerializable(nullable: false)
class JobPost extends Equatable{
  final String id;
  final String description;
  final double hourPay;
  final int availableSlots;
  final String location;
  final bool available;
  final DateTime creationDate;
  final DateTime expireDate;

  const JobPost({
    @required this.id,
    @required this.description,
    @required this.hourPay,
    @required this.availableSlots,
    @required this.location,
    @required this.available,
    @required this.creationDate,
    @required this.expireDate
  });

  @override
  List<Object> get props => [
    id,
    description,
    hourPay,
    availableSlots,
    location,
    available,
    creationDate,
    expireDate,
  ];

  factory JobPost.fromJson(Map<String, dynamic> json) => _$JobPostFromJson(json);

  Map<String, dynamic> toJson() => _$JobPostToJson(this);
}