part of 'job_form_cubit.dart';

class JobFormState extends Equatable {
  const JobFormState({
    this.image,
    this.title = const Title.pure(),
    this.description = const Description.pure(),
    this.city = const City.pure(),
    this.hourRate = const HourRate.pure(),
    this.startDate = '',
    this.endDate = '',
    this.startTime = '',
    this.endTime = '',
    this.additionalInfo = '',
    this.isDisclaimerAccepted = false,
    this.status = FormzStatus.pure,
  });

  final File image;
  final Title title;
  final Description description;
  final City city;
  final HourRate hourRate;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final String additionalInfo;
  final bool isDisclaimerAccepted;
  final FormzStatus status;

  @override
  List<Object> get props => [
        image,
        title,
        description,
        city,
        hourRate,
        startDate,
        endDate,
        startTime,
        endTime,
        additionalInfo,
        isDisclaimerAccepted,
        status
      ];

  JobFormState copyWith({
    File image,
    Title title,
    Description description,
    City city,
    HourRate hourRate,
    String startDate,
    String endDate,
    String startTime,
    String endTime,
    bool isDisclaimerAccepted,
    String additionalInfo,
    FormzStatus status,
  }) {
    return JobFormState(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      city: city ?? this.city,
      hourRate: hourRate ?? this.hourRate,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      isDisclaimerAccepted: isDisclaimerAccepted ?? this.isDisclaimerAccepted,
      status: status ?? this.status,
    );
  }
}
