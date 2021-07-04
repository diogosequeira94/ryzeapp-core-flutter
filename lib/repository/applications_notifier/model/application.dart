import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'application.g.dart';

@JsonSerializable(explicitToJson: true)
class Application extends Equatable {
  final String userId;
  final String userName;
  final String userDescription;
  final String userPhoneNumber;
  final String dateOfAppliance;
  final bool accepted;

  const Application({
    @required this.userName,
    @required this.userDescription,
    @required this.userPhoneNumber,
    @required this.userId,
    @required this.dateOfAppliance,
    @required this.accepted,
  });

  @override
  List<Object> get props => [
        userId,
        userName,
        userDescription,
        userPhoneNumber,
        dateOfAppliance,
        accepted,
      ];

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
