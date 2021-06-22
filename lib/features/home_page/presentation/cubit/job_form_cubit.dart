import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/city.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/description.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/hour_rate.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/title.dart';
import 'package:formz/formz.dart';

part 'job_form_state.dart';

class JobFormCubit extends Cubit<JobFormState> {
  JobFormCubit() : super(const JobFormState());

  void titleChanged(String value) {
    final title = Title.dirty(value);
    emit(state.copyWith(
      startDateTime: state.startDateTime,
      endDateTime: state.endDateTime,
      image: state.image,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      hourRate: state.hourRate,
      additionalInfo: state.additionalInfo,
      title: title,
      status: Formz.validate(
          [title, state.description, state.city, state.hourRate]),
    ));
  }

  void descriptionChanged(String value) {
    final description = Description.dirty(value);
    emit(state.copyWith(
      startDateTime: state.startDateTime,
      endDateTime: state.endDateTime,
      image: state.image,
      hourRate: state.hourRate,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      description: description,
      status: Formz.validate(
          [state.title, description, state.city, state.hourRate]),
    ));
  }

  void cityChanged(String value) {
    final city = City.dirty(value);
    emit(state.copyWith(
      startDateTime: state.startDateTime,
      endDateTime: state.endDateTime,
      image: state.image,
      hourRate: state.hourRate,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      city: city,
      status: Formz.validate(
          [state.title, state.description, city, state.hourRate]),
    ));
  }

  void hourRateChanged(String value) {
    final hourRate = HourRate.dirty(value);
    emit(state.copyWith(
      startDateTime: state.startDateTime,
      endDateTime: state.endDateTime,
      image: state.image,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      hourRate: hourRate,
      status: Formz.validate(
          [state.title, state.description, state.city, hourRate]),
    ));
  }

  void disclaimerCheckboxChanged(bool value) {
    emit(state.copyWith(
      startDateTime: state.startDateTime,
      endDateTime: state.endDateTime,
      image: state.image,
      hourRate: state.hourRate,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: value,
      status: Formz.validate(
          [state.title, state.description, state.city, state.hourRate]),
    ));
  }

  void jobPictureSelected(File imageFile) {
    emit(state.copyWith(
      startDateTime: state.startDateTime,
      endDateTime: state.endDateTime,
      image: imageFile,
      hourRate: state.hourRate,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate(
          [state.title, state.description, state.city, state.hourRate]),
    ));
  }

  void startDateTimeSelected(String value) {
    emit(state.copyWith(
      startDateTime: value,
      endDateTime: state.endDateTime,
      image: state.image,
      hourRate: state.hourRate,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate(
          [state.title, state.description, state.city, state.hourRate]),
    ));
  }

  void endDateTimeSelected(String value) {
    emit(state.copyWith(
      startDateTime: state.startDateTime,
      endDateTime: value,
      image: state.image,
      hourRate: state.hourRate,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate(
          [state.title, state.description, state.city, state.hourRate]),
    ));
  }

  void additionalInfoChanged(String additionalInfoValue) {
    emit(state.copyWith(
      startDateTime: state.startDateTime,
      endDateTime: state.endDateTime,
      image: state.image,
      hourRate: state.hourRate,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      title: state.title,
      additionalInfo: additionalInfoValue,
      status: Formz.validate(
          [state.title, state.description, state.city, state.hourRate]),
    ));
  }
}
