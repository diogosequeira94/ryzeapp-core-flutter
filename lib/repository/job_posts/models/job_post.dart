import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'date_and_time.dart';

part 'job_post.g.dart';

enum JobRateType {
  @JsonValue('hourly')
  hourly,
  @JsonValue('weekly')
  weekly,
  @JsonValue('fixed-term')
  fixed,
}

@JsonSerializable(explicitToJson: true)
class JobPost extends Equatable {
  final String jobID;
  final String posterName;
  final String posterID;
  final String title;
  final String description;
  final String imageUrl;
  final String status;
  final String city;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String hourRate;
  final bool isRemote;
  final String additionalInfo;
  final int slotsAvailable;
  final int maxCandidates;
  final List<String> currentProposals;
  final List<String> languages;

  const JobPost(
      {@required this.jobID,
      @required this.posterName,
      @required this.posterID,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.status,
      @required this.city,
      @required this.hourRate,
      @required this.startDate,
      @required this.startTime,
      @required this.endDate,
      @required this.endTime,
      @required this.additionalInfo,
      @required this.isRemote,
      @required this.slotsAvailable,
      @required this.maxCandidates,
      @required this.currentProposals,
      @required this.languages});

  @override
  List<Object> get props => [
        jobID,
        posterName,
        posterID,
        title,
        description,
        imageUrl,
        status,
        city,
        hourRate,
        isRemote,
        startDate,
        startTime,
        endDate,
        endTime,
        additionalInfo,
        slotsAvailable,
        maxCandidates,
        currentProposals,
        languages,
      ];

  JobPost copyWith({
    String jobID,
    String posterName,
    String posterID,
    String title,
    String description,
    String imageUrl,
    String status,
    String city,
    String hourRate,
    String startDate,
    String startTime,
    String endDate,
    String endTime,
    String additionalInfo,
    bool isRemote,
    int slotsAvailable,
    int maxCandidates,
    int currentProposals,
    List<String> languages,
  }) {
    return JobPost(
      jobID: jobID ?? this.jobID,
      posterName: posterName ?? this.posterName,
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
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      slotsAvailable: slotsAvailable ?? this.slotsAvailable,
      maxCandidates: maxCandidates ?? this.maxCandidates,
      currentProposals: currentProposals ?? this.currentProposals,
      languages: languages ?? this.languages,
    );
  }

  factory JobPost.fromJson(Map<String, dynamic> json) =>
      _$JobPostFromJson(json);

  Map<String, dynamic> toJson() => _$JobPostToJson(this);
}
