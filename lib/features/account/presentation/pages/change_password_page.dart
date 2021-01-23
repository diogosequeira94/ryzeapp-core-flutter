import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          UserProfileString.changePasswordTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _CurrentPasswordInput(),
              _NewPasswordInput(),
              _ConfirmNewPasswordInput(),
              const SizedBox(height: 24.0),
              RyzePrimaryButton(
                  title: UserProfileString.submitChangesBtn,
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

class _CurrentPasswordInput extends StatelessWidget {
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
            labelText: 'Current Password',
            hintText: 'Insert current Password',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (description) => {}),
    );
  }
}

class _NewPasswordInput extends StatelessWidget {
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
            labelText: 'New Password',
            hintText: 'Insert new Password',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (description) => {}),
    );
  }
}

class _ConfirmNewPasswordInput extends StatelessWidget {
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
            labelText: 'Confirm Password',
            hintText: 'Confirm new Password',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Color(0xFF3229bf)),
            ),
          ),
          onChanged: (description) => {}),
    );
  }
}
