import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'notification.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationModel extends Equatable {
  final String notificationType;
  final String posterId;
  final String applierName;
  final String applierId;
  final String applierDescription;
  final String applierPhoneNumber;
  final String jobTitle;
  final String jobId;

  const NotificationModel({
    @required this.notificationType,
    @required this.posterId,
    @required this.applierName,
    @required this.applierDescription,
    @required this.applierPhoneNumber,
    @required this.applierId,
    @required this.jobTitle,
    @required this.jobId,
  });

  @override
  List<Object> get props => [
        notificationType,
        posterId,
        applierName,
        applierDescription,
        applierPhoneNumber,
        applierId,
        jobTitle,
        jobId,
      ];

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
