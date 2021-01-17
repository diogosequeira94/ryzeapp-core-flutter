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

  const JobPost(
      {@required this.jobID,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.city,
      @required this.hourRate,
      @required this.isRemote,
      @required this.slotsAvailable,
      @required this.languages});

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

  JobPost copyWith({
    String jobID,
    String title,
    String description,
    String imageUrl,
    String city,
    String hourRate,
    bool isRemote,
    int slotsAvailable,
    List<String> languages,
  }) {
    return JobPost(
      jobID: jobID ?? this.jobID,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      city: city ?? this.city,
      hourRate: hourRate ?? this.hourRate,
      isRemote: isRemote ?? this.isRemote,
      slotsAvailable: slotsAvailable ?? this.slotsAvailable,
      languages: languages ?? this.languages,
    );
  }

  factory JobPost.fromJson(Map<String, dynamic> json) =>
      _$JobPostFromJson(json);

  Map<String, dynamic> toJson() => _$JobPostToJson(this);
}
