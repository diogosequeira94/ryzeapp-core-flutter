import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/features/user_profile/model/form/date_of_birth.dart';
import 'package:firebaseblocryze/features/user_profile/model/form/form.dart';
import 'package:formz/formz.dart';

part 'user_form_state.dart';

class UserProfileFormCubit extends Cubit<UserFormState> {
  UserProfileFormCubit() : super(const UserFormState());

  void aboutChanged(String value) {
    final about = About.dirty(value);
    emit(state.copyWith(
      about: about,
      dateOfBirth: state.dateOfBirth,
      profilePicture: state.profilePicture,
      city: state.city,
      phoneNumber: state.phoneNumber,
      skills: state.skills,
      status: Formz.validate(
          [about, state.city, state.dateOfBirth, state.phoneNumber]),
    ));
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(state.copyWith(
      about: state.about,
      dateOfBirth: state.dateOfBirth,
      profilePicture: state.profilePicture,
      city: state.city,
      phoneNumber: phoneNumber,
      skills: state.skills,
      status: Formz.validate(
          [state.about, state.dateOfBirth, state.city, phoneNumber]),
    ));
  }

  void skillAdded(String value) {
    if(state.skills.length == 5){
      print('cant add more');
      return;
    }
    print('skill added');
    List<String> skillsList = List.from(state.skills);
    skillsList.add(value);
    print('Skills List after Add: $skillsList');
    emit(state.copyWith(
      about: state.about,
      dateOfBirth: state.dateOfBirth,
      profilePicture: state.profilePicture,
      city: state.city,
      phoneNumber: state.phoneNumber,
      skills: skillsList,
      status: Formz.validate(
          [state.about, state.dateOfBirth, state.city, state.phoneNumber]),
    ));
  }

  void removeSkillTag(String tag) {
    print('skill delete');
    List<String> skillsList = List.from(state.skills);
    skillsList.removeWhere((element) => element == tag);
    print('Skills List after Removal: $skillsList');
    emit(state.copyWith(
      about: state.about,
      dateOfBirth: state.dateOfBirth,
      profilePicture: state.profilePicture,
      city: state.city,
      phoneNumber: state.phoneNumber,
      skills: skillsList,
      status: Formz.validate(
          [state.about, state.dateOfBirth, state.city, state.phoneNumber]),
    ));
  }

  void dateOfBirthSelected(String value) {
    final dateOfBirth = DateOfBirth.dirty(value);
    emit(state.copyWith(
      about: state.about,
      profilePicture: state.profilePicture,
      city: state.city,
      dateOfBirth: dateOfBirth,
      phoneNumber: state.phoneNumber,
      skills: state.skills,
      status: Formz.validate(
          [state.about, dateOfBirth, state.city, state.phoneNumber]),
    ));
  }

  void cityChanged(String value) {
    final city = City.dirty(value);
    emit(state.copyWith(
      about: state.about,
      profilePicture: state.profilePicture,
      city: city,
      phoneNumber: state.phoneNumber,
      skills: state.skills,
      status: Formz.validate(
          [state.about, state.dateOfBirth, city, state.phoneNumber]),
    ));
  }

  void profilePictureSelected(File imageFile) {
    emit(state.copyWith(
      about: state.about,
      profilePicture: imageFile,
      city: state.city,
      phoneNumber: state.phoneNumber,
      skills: state.skills,
      status: Formz.validate(
          [state.about, state.dateOfBirth, state.city, state.phoneNumber]),
    ));
  }
}
