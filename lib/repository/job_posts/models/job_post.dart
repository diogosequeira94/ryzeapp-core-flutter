import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'job_post.g.dart';

@JsonSerializable(explicitToJson: true)
class JobPost extends Equatable {
  final String jobID;
  final String title;
  final String description;
  final String imageUrl;
  final String city;
  final String hourRate;
  final bool isRemote;
  final int slotsAvailable;
  final List<String> languages;

  const JobPost({
    @required this.jobID,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.city,
    @required this.hourRate,
    @required this.isRemote,
    @required this.slotsAvailable,
    @required this.languages
  });

  @override
  List<Object> get props => [
    jobID,
    title,
    description,
    imageUrl,
    city,
    hourRate,
    isRemote,
    slotsAvailable,
    languages,
  ];

  factory JobPost.fromJson(Map<String, dynamic> json) => _$JobPostFromJson(json);

  Map<String, dynamic> toJson() => _$JobPostToJson(this);
}