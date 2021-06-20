import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_profile.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfile extends Equatable {
  final String firstName;
  final String lastName;
  final String about;
  final String email;
  final String dateOfBirth;
  final String city;
  final bool isDriver;
  final String skills;
  final String education;

  const UserProfile({
    @required this.firstName,
    @required this.lastName,
    @required this.about,
    @required this.email,
    @required this.dateOfBirth,
    @required this.city,
    @required this.isDriver,
    @required this.skills,
    @required this.education,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        about,
        email,
        dateOfBirth,
        city,
        isDriver,
        skills,
        education,
      ];

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
