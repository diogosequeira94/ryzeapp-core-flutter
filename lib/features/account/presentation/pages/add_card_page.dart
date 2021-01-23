import 'package:firebaseblocryze/features/account/utils/account_strings.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
          autofocus: false,
          maxLength: 50,
          keyboardType: TextInputType.text,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AccountStrings.cardholderLabel,
            hintText: AccountStrings.cardholderHint,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (description) => {}),
    );
  }
}

class _CardNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
          autofocus: false,
          maxLength: 16,
          keyboardType: TextInputType.number,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AccountStrings.cardNumberLabel,
            hintText: AccountStrings.cardNumberHint,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (description) => {}),
    );
  }
}

class _ExpiryDateInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
          autofocus: false,
          maxLength: 50,
          keyboardType: TextInputType.number,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AccountStrings.expiryDateLabel,
            hintText: AccountStrings.expiryDateHint,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (description) => {}),
    );
  }
}

class _CVV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
          autofocus: false,
          maxLength: 3,
          keyboardType: TextInputType.number,
          enabled: true,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: AccountStrings.cvvLabel,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (description) => {}),
    );
  }
}
