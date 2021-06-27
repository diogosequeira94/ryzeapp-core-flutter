import 'package:firebaseblocryze/features/login/blocs/register/register_bloc.dart';
import 'package:firebaseblocryze/features/login/presentation/widgets/sign_in_header.dart';
import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) => LoginStrings.cancelledByUser,
                  serverError: (_) => LoginStrings.serverError,
                  emailAlreadyInUse: (_) => LoginStrings.emailAlreadyInUse,
                  emailNotFound: (_) => LoginStrings.emailNotFound,
                  invalidCredentials: (_) => LoginStrings.invalidCredentials,
                ),
              ).show(context);
            },
            (userId) {
              Navigator.of(context)
                  .pushReplacementNamed('/bottom-nav', arguments: userId);
            },
          ),
        );
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SignInHeader(),
              Form(
                autovalidate: state.showErrorMessages,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: LoginStrings.textFieldFirstName,
                          ),
                          autocorrect: false,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterEvent.firstNameChanged(value)),
                          validator: (_) => context
                              .read<RegisterBloc>()
                              .state
                              .firstName
                              .value
                              .fold(
                                  (f) => f.maybeMap(
                                      shortFirstOrLastName: (_) =>
                                          LoginStrings.textFieldFirstNameError,
                                      orElse: () => null),
                                  (_) => null)),
                      const SizedBox(height: 16.0),
                      TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: LoginStrings.textFieldLastName,
                          ),
                          autocorrect: false,
                          onChanged: (value) => context
                              .read<RegisterBloc>()
                              .add(RegisterEvent.lastNameChanged(value)),
                          validator: (_) => context
                              .read<RegisterBloc>()
                              .state
                              .lastName
                              .value
                              .fold(
                                  (f) => f.maybeMap(
                                      shortFirstOrLastName: (_) =>
                                          LoginStrings.textFieldSurnameError,
                                      orElse: () => null),
                                  (_) => null)),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: LoginStrings.textFieldEmailLabel,
                        ),
                        autocorrect: false,
                        onChanged: (value) => context
                            .read<RegisterBloc>()
                            .add(RegisterEvent.emailChanged(value)),
                        validator: (_) => context
                            .read<RegisterBloc>()
                            .state
                            .emailAddress
                            .value
                            .fold(
                                (f) => f.maybeMap(
                                    invalidEmail: (_) =>
                                        LoginStrings.textFieldEmailError,
                                    orElse: () => null),
                                (_) => null),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: LoginStrings.textFieldPasswordLabel,
                        ),
                        autocorrect: false,
                        obscureText: true,
                        onChanged: (value) {
                          context.read<RegisterBloc>().add(
                                RegisterEvent.passwordChanged(value),
                              );
                        },
                        validator: (_) => context
                            .read<RegisterBloc>()
                            .state
                            .password
                            .value
                            .fold(
                                (f) => f.maybeMap(
                                    shortPassword: (_) =>
                                        LoginStrings.textFieldPasswordError,
                                    orElse: () => null),
                                (_) => null),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32.0),
                        child: RyzePrimaryButton(
                            title: LoginStrings.registerButton,
                            action: () {
                              context.read<RegisterBloc>().add(
                                    const RegisterEvent
                                        .registerWithEmailAndPasswordPressed(),
                                  );
                            },
                            isAffirmative: true),
                      ),
                      Center(
                          child: InkWell(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .color),
                            children: [
                              new TextSpan(text: 'Already have an account? '),
                              new TextSpan(
                                  text: 'Login',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        onTap: () => Navigator.of(context).pushNamed('/login'),
                      )),
                      if (state.isSubmitting) ...[
                        const SizedBox(height: 8.0),
                        const LinearProgressIndicator(value: null),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
