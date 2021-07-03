import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'notification.g.dart';

@JsonSerializable(explicitToJson: true)
class Notification extends Equatable {
  final String posterId;
  final String candidateId;
  final String jobTitle;
  final String jobId;

  const Notification({
    @required this.posterId,
    @required this.candidateId,
    @required this.jobTitle,
    @required this.jobId,
  });

  @override
  List<Object> get props => [
        posterId,
        candidateId,
        jobTitle,
        jobId,
      ];

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
