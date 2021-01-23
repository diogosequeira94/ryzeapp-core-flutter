part of 'add_card_form_cubit.dart';

class AddCardFormState extends Equatable {
  const AddCardFormState({
    this.cardholder = const Cardholder.pure(),
    this.cardNumber = const CardNumber.pure(),
    this.expiryDate = const ExpiryDate.pure(),
    this.cvv = const CVV.pure(),
    this.status = FormzStatus.pure,
  });

  final Cardholder cardholder;
  final CardNumber cardNumber;
  final ExpiryDate expiryDate;
  final CVV cvv;
  final FormzStatus status;

  @override
  List<Object> get props => [cardholder, cardNumber, expiryDate, cvv, status];

  AddCardFormState copyWith({
    Cardholder cardholder,
    CardNumber cardNumber,
    ExpiryDate expiryDate,
    CVV cvv,
    FormzStatus status,
  }) {
    return AddCardFormState(
      cardholder: cardholder ?? this.cardholder,
      cardNumber: cardNumber ?? this.cardNumber,
      expiryDate: expiryDate ?? this.expiryDate,
      cvv: cvv ?? this.cvv,
      status: status ?? this.status,
    );
  }
}
