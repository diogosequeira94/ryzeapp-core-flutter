import 'package:firebaseblocryze/features/login_feature/domain/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/utils/login_strings.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
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
                  invalidCredentials: (_) =>
                      LoginStrings.invalidCredentials,
                ),
              ).show(context);
            },
            (_) {
              // TODO: Navigate
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidate: state.showErrorMessages,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      image: AssetImage('assets/ryze-app-logo.jpg'),
                      fit: BoxFit.fill,
                      width: 100,
                      height: 250,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: LoginStrings.textFieldEmailLabel,
                  ),
                  autocorrect: false,
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.emailChanged(value)),
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                          (f) => f.maybeMap(
                              invalidEmail: (_) => LoginStrings.textFieldEmailError,
                              orElse: () => null),
                          (_) => null),
                ),
                const SizedBox(height: 8.0),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: LoginStrings.textFieldPasswordLabel,
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) {
                    context.read<SignInFormBloc>().add(
                          SignInFormEvent.passwordChanged(value),
                        );
                  },
                  validator: (_) => context
                      .read<SignInFormBloc>()
                      .state
                      .password
                      .value
                      .fold(
                          (f) => f.maybeMap(
                              shortPassword: (_) => LoginStrings.textFieldPasswordError,
                              orElse: () => null),
                          (_) => null),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .signInWithEmailAndPasswordPressed(),
                              );
                        },
                        child: const Text(LoginStrings.signInButton),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .registerWithEmailAndPasswordPressed(),
                              );
                        },
                        child: const Text(LoginStrings.registerButton),
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    context.read<SignInFormBloc>().add(
                          const SignInFormEvent.signInWithGooglePressed(),
                        );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black38)
                  ),
                  color: Colors.deepPurpleAccent,
                  child: const Text(
                    LoginStrings.signInGoogleButton,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
