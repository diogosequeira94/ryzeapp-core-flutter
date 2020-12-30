import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserProfileModel extends Equatable {
  final String name;
  final String jobTitle;
  final String profilePic;
  final String about;
  final String email;
  final String currentCity;
  final String dateOfBirth;

  UserProfileModel({
    @required this.name,
    @required this.jobTitle,
    @required this.profilePic,
    @required this.about,
    @required this.email,
    @required this.currentCity,
    @required this.dateOfBirth,
  });

  @override
  List<Object> get props => [
    name,
    jobTitle,
    profilePic,
    about,
    email,
    currentCity,
    dateOfBirth
  ];
}
