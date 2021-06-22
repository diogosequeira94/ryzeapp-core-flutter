import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'job_post.g.dart';

@JsonSerializable(explicitToJson: true)
class JobPost extends Equatable {
  final String jobID;
  final String posterID;
  final String title;
  final String description;
  final String imageUrl;
  final String status;
  final String city;
  final String startDate;
  final String endDate;
  final String hourRate;
  final bool isRemote;
  final String additionalInfo;
  final int slotsAvailable;
  final List<String> languages;

  const JobPost(
      {@required this.jobID,
      @required this.posterID,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.status,
      @required this.city,
      @required this.hourRate,
      @required this.startDate,
      @required this.endDate,
      @required this.additionalInfo,
      @required this.isRemote,
      @required this.slotsAvailable,
      @required this.languages});

  @override
  List<Object> get props => [
        jobID,
        posterID,
        title,
        description,
        imageUrl,
        status,
        city,
        hourRate,
        isRemote,
        startDate,
        endDate,
        additionalInfo,
        slotsAvailable,
        languages,
      ];

  JobPost copyWith({
    String jobID,
    String posterID,
    String title,
    String description,
    String imageUrl,
    String status,
    String city,
    String hourRate,
    String startDate,
    String endDate,
    String additionalInfo,
    bool isRemote,
    int slotsAvailable,
    List<String> languages,
  }) {
    return JobPost(
      jobID: jobID ?? this.jobID,
      posterID: posterID ?? this.posterID,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      city: city ?? this.city,
      hourRate: hourRate ?? this.hourRate,
      isRemote: isRemote ?? this.isRemote,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      slotsAvailable: slotsAvailable ?? this.slotsAvailable,
      languages: languages ?? this.languages,
    );
  }

  factory JobPost.fromJson(Map<String, dynamic> json) =>
      _$JobPostFromJson(json);

  Map<String, dynamic> toJson() => _$JobPostToJson(this);
}
