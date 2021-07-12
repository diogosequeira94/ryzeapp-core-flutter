part of 'user_form_cubit.dart';

class UserFormState extends Equatable {
  const UserFormState({
    this.profilePicture,
    this.about = const About.pure(),
    this.dateOfBirth = const DateOfBirth.pure(),
    this.city = const City.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.skills = const [],
    this.status = FormzStatus.pure,
  });

  final File profilePicture;
  final About about;
  final DateOfBirth dateOfBirth;
  final City city;
  final PhoneNumber phoneNumber;
  final List<String> skills;
  final FormzStatus status;

  @override
  List<Object> get props =>
      [profilePicture, about, dateOfBirth, city, phoneNumber, skills, status];

  UserFormState copyWith({
    File profilePicture,
    About about,
    DateOfBirth dateOfBirth,
    City city,
    PhoneNumber phoneNumber,
    List<String> skills,
    FormzStatus status,
  }) {
    return UserFormState(
      profilePicture: profilePicture ?? this.profilePicture,
      about: about ?? this.about,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      city: city ?? this.city,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      skills: skills ?? this.skills,
      status: status ?? this.status,
    );
  }
}
