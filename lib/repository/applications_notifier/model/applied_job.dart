import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'applied_job.g.dart';

@JsonSerializable(explicitToJson: true)
class AppliedJob extends Equatable {
  final String jobTitle;
  final String dateOfApplication;
  final bool accepted;

  const AppliedJob({
    @required this.jobTitle,
    @required this.dateOfApplication,
    @required this.accepted,
  });

  @override
  List<Object> get props => [
    jobTitle,
    dateOfApplication,
    accepted,
  ];

  factory AppliedJob.fromJson(Map<String, dynamic> json) =>
      _$AppliedJobFromJson(json);

  Map<String, dynamic> toJson() => _$AppliedJobToJson(this);
}
