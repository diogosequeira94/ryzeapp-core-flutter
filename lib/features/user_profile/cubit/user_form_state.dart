part of 'user_form_cubit.dart';

class UserFormState extends Equatable {
  const UserFormState({
    this.profilePicture,
    this.about = const About.pure(),
    this.dateOfBirth = const DateOfBirth.pure(),
    this.city = const City.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.status = FormzStatus.pure,
  });

  final File profilePicture;
  final About about;
  final DateOfBirth dateOfBirth;
  final City city;
  final PhoneNumber phoneNumber;
  final FormzStatus status;

  @override
  List<Object> get props =>
      [profilePicture, about, dateOfBirth, city, phoneNumber, status];

  UserFormState copyWith({
    File profilePicture,
    About about,
    DateOfBirth dateOfBirth,
    City city,
    PhoneNumber phoneNumber,
    FormzStatus status,
  }) {
    return UserFormState(
      profilePicture: profilePicture ?? this.profilePicture,
      about: about ?? this.about,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      city: city ?? this.city,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
    );
  }
}
