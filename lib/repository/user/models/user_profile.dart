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
  final String phoneNumber;
  final String dateOfBirth;
  final String city;
  final bool isDriver;
  final String skills;
  final String education;
  final int jobsCompleted;
  final int noShows;

  const UserProfile({
    @required this.firstName,
    @required this.lastName,
    @required this.about,
    @required this.email,
    @required this.phoneNumber,
    @required this.dateOfBirth,
    @required this.city,
    @required this.isDriver,
    @required this.skills,
    @required this.education,
    @required this.jobsCompleted,
    @required this.noShows,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        about,
        email,
        phoneNumber,
        dateOfBirth,
        city,
        isDriver,
        skills,
        education,
        jobsCompleted,
        noShows,
      ];

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
