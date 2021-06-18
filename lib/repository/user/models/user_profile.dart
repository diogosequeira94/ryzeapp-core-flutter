import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

@JsonSerializable(explicitToJson: true)
class UserProfile extends Equatable {
  final String name;
  final String surname;
  final String about;
  final String email;
  final String dateOfBirth;
  final String city;
  final bool isDriver;
  final String skills;
  final String education;

  const UserProfile({
    @required this.name,
    @required this.surname,
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
        name,
        surname,
        about,
        email,
        dateOfBirth,
        city,
        isDriver,
        skills,
        education,
      ];
}
