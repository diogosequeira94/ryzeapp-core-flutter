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
      title: title,
      status: Formz.validate([title, state.description, state.city, state.hourRate]),
    ));
  }

  void descriptionChanged(String value) {
    final description = Description.dirty(value);
    emit(state.copyWith(
      description: description,
      status: Formz.validate(
          [state.title, description, state.city, state.hourRate]),
    ));
  }

  void cityChanged(String value) {
    final city = City.dirty(value);
    emit(state.copyWith(
      city: city,
      status: Formz.validate(
          [state.title, state.description, city, state.hourRate]),
    ));
  }

  void hourRateChanged(String value) {
    final hourRate = HourRate.dirty(value);
    emit(state.copyWith(
      hourRate: hourRate,
      status: Formz.validate(
          [state.title, state.description, state.city, hourRate]),
    ));
  }
}
