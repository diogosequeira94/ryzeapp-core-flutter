import 'package:firebaseblocryze/features/account/cubit/add_card_form_cubit.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/credit_card_widget.dart';
import 'package:firebaseblocryze/features/account/utils/account_strings.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          AccountStrings.addCardTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<AddCardFormCubit, AddCardFormState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CreditCardWidget(
                        cardNumber: state.cardNumber.value,
                        cardHolder: state.cardholder.value,
                        cardExpirationDate: state.expiryDate.value),
                  );
                },
              ),
              _CardHolderInput(),
              _CardNumberInput(),
              _ExpiryDateInput(),
              _CVV(),
              const SizedBox(height: 24.0),
              RyzePrimaryButton(
                  title: AccountStrings.addCardBtn,
                  action: () => Navigator.pop(context),
                  isAffirmative: true),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardHolderInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCardFormCubit, AddCardFormState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
            autofocus: false,
            maxLength: 20,
            keyboardType: TextInputType.text,
            enabled: true,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: AccountStrings.cardholderLabel,
              hintText: AccountStrings.cardholderHint,
              errorText: state.cardholder.invalid ? 'Invalid Cardholder' : null,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
              ),
            ),
            onChanged: (cardholder) {
              context.read<AddCardFormCubit>().cardholderChanged(cardholder);
            }),
      );
    });
  }
}

class _CardNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardNumberMaskFormatter = new MaskTextInputFormatter(mask: '#### #### #### ####', filter: { "#": RegExp(r'[0-9]') });
    return BlocBuilder<AddCardFormCubit, AddCardFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextFormField(
            inputFormatters: [cardNumberMaskFormatter],
              autofocus: false,
              maxLength: 20,
              keyboardType: TextInputType.number,
              enabled: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: AccountStrings.cardNumberLabel,
                hintText: AccountStrings.cardNumberHint,
                errorText:
                    state.cardNumber.invalid ? 'Invalid CardNumber' : null,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
                ),
              ),
              onChanged: (cardNumber) {
                context.read<AddCardFormCubit>().cardNumberChanged(cardNumber);
              }),
        );
      },
    );
  }
}

class _ExpiryDateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expiryDateMaskFormatter = new MaskTextInputFormatter(mask: '##/##', filter: { "#": RegExp(r'[0-9]') });
    return BlocBuilder<AddCardFormCubit, AddCardFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextFormField(
            inputFormatters: [expiryDateMaskFormatter],
              autofocus: false,
              maxLength: 5,
              keyboardType: TextInputType.number,
              enabled: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: AccountStrings.expiryDateLabel,
                hintText: AccountStrings.expiryDateHint,
                errorText:
                    state.cardNumber.invalid ? 'Invalid ExpiryDate' : null,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
                ),
              ),
              onChanged: (expiryDate) {
                context.read<AddCardFormCubit>().expiryDateChanged(expiryDate);
              }),
        );
      },
    );
  }
}

class _CVV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCardFormCubit, AddCardFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextFormField(
              autofocus: false,
              maxLength: 3,
              obscureText: true,
              keyboardType: TextInputType.number,
              enabled: true,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: AccountStrings.cvvLabel,
                errorText: state.cardNumber.invalid
                    ? 'CVV needs to be exactly 3 digits'
                    : null,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
                ),
              ),
              onChanged: (cvv) {
                context.read<AddCardFormCubit>().cvvChanged(cvv);
              }),
        );
      },
    );
  }
}
