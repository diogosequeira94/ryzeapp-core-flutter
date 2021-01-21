part of 'job_form_cubit.dart';

class JobFormState extends Equatable {
  const JobFormState({
    this.image,
    this.title = const Title.pure(),
    this.description = const Description.pure(),
    this.city = const City.pure(),
    this.hourRate = const HourRate.pure(),
    this.startDateTime = '',
    this.endDateTime = '',
    this.isDisclaimerAccepted = false,
    this.status = FormzStatus.pure,
  });

  final File image;
  final Title title;
  final Description description;
  final City city;
  final HourRate hourRate;
  final String startDateTime;
  final String endDateTime;
  final bool isDisclaimerAccepted;
  final FormzStatus status;

  @override
  List<Object> get props => [image, title, description, city, hourRate, startDateTime, endDateTime, isDisclaimerAccepted, status];

  JobFormState copyWith({
    File image,
    Title title,
    Description description,
    City city,
    HourRate hourRate,
    String startDateTime,
    String endDateTime,
    bool isDisclaimerAccepted,
    FormzStatus status,
  }) {
    return JobFormState(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      city: city ?? this.city,
      hourRate: hourRate ?? this.hourRate,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      isDisclaimerAccepted: isDisclaimerAccepted ?? this.isDisclaimerAccepted,
      status: status ?? this.status,
    );
  }
}
