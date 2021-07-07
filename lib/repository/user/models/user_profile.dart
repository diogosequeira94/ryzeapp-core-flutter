import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_profile.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfile extends Equatable {
  final String firstName;
  final String lastName;
  final String profilePicUrl;
  final String about;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  final String city;
  final bool isDriver;
  final List<String> skills;
  final String education;
  final int jobsCompleted;
  final int noShows;
  final bool isComplete;

  const UserProfile({
    @required this.firstName,
    @required this.lastName,
    @required this.profilePicUrl,
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
    @required this.isComplete,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        profilePicUrl,
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
        isComplete,
      ];

  UserProfile copyWith({
    String firstName,
    String lastName,
    String profilePicUrl,
    String about,
    String email,
    String phoneNumber,
    String dateOfBirth,
    String city,
    bool isDriver,
    List<String> skills,
    String education,
    int jobsCompleted,
    int noShows,
    bool isComplete,
  }) {
    return UserProfile(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      about: about ?? this.about,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      city: city ?? this.city,
      isDriver: isDriver ?? this.isDriver,
      skills: skills ?? this.skills,
      education: education ?? this.education,
      jobsCompleted: jobsCompleted ?? this.jobsCompleted,
      noShows: noShows ?? this.noShows,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
