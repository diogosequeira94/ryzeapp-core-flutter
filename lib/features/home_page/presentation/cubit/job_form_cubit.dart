import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/city.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/description.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/hour_rate.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/shift_duration.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/forms/title.dart';
import 'package:formz/formz.dart';

part 'job_form_state.dart';

class JobFormCubit extends Cubit<JobFormState> {
  JobFormCubit() : super(const JobFormState());

  void titleChanged(String value) {
    final title = Title.dirty(value);
    emit(state.copyWith(
      startDate: state.startDate,
      endDate: state.endDate,
      startTime: state.startTime,
      endTime: state.endTime,
      image: state.image,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      title: title,
      status: Formz.validate([
        title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void descriptionChanged(String value) {
    final description = Description.dirty(value);
    emit(state.copyWith(
      title: state.title,
      startDate: state.startDate,
      endDate: state.endDate,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      startTime: state.startTime,
      endTime: state.endTime,
      image: state.image,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      description: description,
      status: Formz.validate([
        state.title,
        description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void cityChanged(String value) {
    final city = City.dirty(value);
    emit(state.copyWith(
      title: state.title,
      startDate: state.startDate,
      endDate: state.endDate,
      startTime: state.startTime,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      endTime: state.endTime,
      image: state.image,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      city: city,
      status: Formz.validate([
        state.title,
        state.description,
        city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void startTypeSelected(JobStartType jobStartType) {
    emit(state.copyWith(
      title: state.title,
      startDate: state.startDate,
      endDate: state.endDate,
      startTime: state.startTime,
      endTime: state.endTime,
      image: state.image,
      jobStartType: jobStartType,
      hourRate: state.hourRate,
      shiftDuration: state.shiftDuration,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      city: state.city,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void hourRateChanged(String value) {
    final hourRate = HourRate.dirty(value);
    emit(state.copyWith(
      title: state.title,
      startDate: state.startDate,
      endDate: state.endDate,
      startTime: state.startTime,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      endTime: state.endTime,
      image: state.image,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      hourRate: hourRate,
      payTerms: state.payTerms,
      category: state.category,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void shiftDurationChanged(String value) {
    final shiftDuration = ShiftDuration.dirty(value);
    emit(state.copyWith(
      title: state.title,
      startDate: state.startDate,
      endDate: state.endDate,
      startTime: state.startTime,
      jobStartType: state.jobStartType,
      shiftDuration: shiftDuration,
      endTime: state.endTime,
      image: state.image,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        shiftDuration,
        state.hourRate
      ]),
    ));
  }

  void disclaimerCheckboxChanged(bool value) {
    emit(state.copyWith(
      title: state.title,
      startDate: state.startDate,
      endDate: state.endDate,
      startTime: state.startTime,
      endTime: state.endTime,
      image: state.image,
      hourRate: state.hourRate,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: value,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void jobPictureSelected(File imageFile) {
    emit(state.copyWith(
      title: state.title,
      startDate: state.startDate,
      endDate: state.endDate,
      startTime: state.startTime,
      endTime: state.endTime,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      image: imageFile,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void startDateSelected(String value) {
    emit(state.copyWith(
      title: state.title,
      startTime: state.startTime,
      startDate: value,
      endDate: state.endDate,
      endTime: state.endTime,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      image: state.image,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void payTermsSelected(String value) {
    emit(state.copyWith(
      title: state.title,
      startTime: state.startTime,
      startDate: state.startDate,
      endDate: state.endDate,
      endTime: state.endTime,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      image: state.image,
      hourRate: state.hourRate,
      payTerms: value,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void categorySelected(String value) {
    emit(state.copyWith(
      title: state.title,
      startTime: state.startTime,
      startDate: state.startDate,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      payTerms: state.payTerms,
      category: value,
      endDate: state.endDate,
      endTime: state.endTime,
      image: state.image,
      hourRate: state.hourRate,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void startTimeSelected(String value) {
    emit(state.copyWith(
      title: state.title,
      startTime: value,
      startDate: state.startDate,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      endDate: state.endDate,
      endTime: state.endTime,
      image: state.image,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void endDateSelected(String value) {
    emit(state.copyWith(
      title: state.title,
      startTime: state.startTime,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      startDate: state.startDate,
      endDate: value,
      endTime: state.endTime,
      image: state.image,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void endTimeSelected(String value) {
    emit(state.copyWith(
      title: state.title,
      startTime: state.startTime,
      startDate: state.startDate,
      endDate: state.endDate,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      endTime: value,
      image: state.image,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      additionalInfo: state.additionalInfo,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }

  void additionalInfoChanged(String additionalInfoValue) {
    emit(state.copyWith(
      startDate: state.startDate,
      endDate: state.endDate,
      startTime: state.startTime,
      endTime: state.endTime,
      jobStartType: state.jobStartType,
      shiftDuration: state.shiftDuration,
      image: state.image,
      hourRate: state.hourRate,
      payTerms: state.payTerms,
      category: state.category,
      isDisclaimerAccepted: state.isDisclaimerAccepted,
      title: state.title,
      additionalInfo: additionalInfoValue,
      status: Formz.validate([
        state.title,
        state.description,
        state.city,
        state.hourRate,
        state.shiftDuration
      ]),
    ));
  }
}
