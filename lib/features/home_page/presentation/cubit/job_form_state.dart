part of 'job_form_cubit.dart';

class JobFormState extends Equatable {
  const JobFormState({
    this.title = const Title.pure(),
    this.description = const Description.pure(),
    this.city = const City.pure(),
    this.hourRate = const HourRate.pure(),
    this.status = FormzStatus.pure,
  });

  final Title title;
  final Description description;
  final City city;
  final HourRate hourRate;
  final FormzStatus status;

  @override
  List<Object> get props => [title, description, city, hourRate, status];

  JobFormState copyWith({
    Title title,
    Description description,
    City city,
    HourRate hourRate,
    FormzStatus status,
  }) {
    return JobFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      city: city ?? this.city,
      hourRate: hourRate ?? this.hourRate,
      status: status ?? this.status,
    );
  }
}
