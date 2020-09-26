import 'package:equatable/equatable.dart';

class EmailAddress extends Equatable {
  final String emailValue;
  const EmailAddress(this.emailValue) : assert(emailValue != null);

  @override
  List<Object> get props => [emailValue];

  @override
  String toString() => 'EmailAdress($emailValue)';
}