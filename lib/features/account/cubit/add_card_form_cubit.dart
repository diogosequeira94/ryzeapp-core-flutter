import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaseblocryze/features/account/model/form/add_card/cardholder.dart';
import 'package:firebaseblocryze/features/account/model/form/add_card/cardnumber.dart';
import 'package:firebaseblocryze/features/account/model/form/add_card/cvv.dart';
import 'package:firebaseblocryze/features/account/model/form/add_card/expiry_date.dart';
import 'package:formz/formz.dart';

part 'add_card_form_state.dart';

class AddCardFormCubit extends Cubit<AddCardFormState> {
  AddCardFormCubit() : super(AddCardFormState());

  void cardholderChanged(String value) {
    final cardholder = Cardholder.dirty(value);
    emit(state.copyWith(
      cardholder: cardholder,
      cardNumber: state.cardNumber,
      expiryDate: state.expiryDate,
      cvv: state.cvv,
      status: Formz.validate(
          [cardholder, state.cardNumber, state.expiryDate, state.cvv]),
    ));
  }

  void cardNumberChanged(String value) {
    final cardNumber = CardNumber.dirty(value);
    emit(state.copyWith(
      cardNumber: cardNumber,
      cardholder: state.cardholder,
      expiryDate: state.expiryDate,
      cvv: state.cvv,
      status: Formz.validate(
          [state.cardholder, cardNumber, state.expiryDate, state.cvv]),
    ));
  }

  void expiryDateChanged(String value) {
    final expiryDate = ExpiryDate.dirty(value);
    emit(state.copyWith(
      expiryDate: expiryDate,
      cardholder: state.cardholder,
      cardNumber: state.cardNumber,
      cvv: state.cvv,
      status: Formz.validate(
          [state.cardholder, state.cardNumber, expiryDate, state.cvv]),
    ));
  }

  void cvvChanged(String value) {
    final cvv = CVV.dirty(value);
    emit(state.copyWith(
      cvv: cvv,
      cardholder: state.cardholder,
      expiryDate: state.expiryDate,
      cardNumber: state.cardNumber,
      status: Formz.validate(
          [state.cardholder, state.cardNumber, state.expiryDate, cvv]),
    ));
  }
}
