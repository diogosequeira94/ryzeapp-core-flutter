import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login/blocs/sign_in_form/sign_in_form_bloc.dart';
import 'package:firebaseblocryze/features/login/presentation/widgets/sign_in_google_button.dart';
import 'package:firebaseblocryze/features/login/presentation/widgets/sign_in_header.dart';
import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
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
                  invalidCredentials: (_) => LoginStrings.invalidCredentials,
                ),
              ).show(context);
            },
            (_) {
              Navigator.of(context).pushReplacementNamed('/bottom-nav');
              context
                  .bloc<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
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
                                    shortPassword: (_) =>
                                        LoginStrings.textFieldPasswordError,
                                    orElse: () => null),
                                (_) => null),
                      ),
                      const SizedBox(height: 16.0),
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            onTap: () {},
                          )),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
                        child: RyzePrimaryButton(
                            title: LoginStrings.signInButton,
                            action: () {
                              context.read<SignInFormBloc>().add(
                                    const SignInFormEvent
                                        .signInWithEmailAndPasswordPressed(),
                                  );
                            },
                            isAffirmative: true),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: SignInGoogleButton(
                          action: () {
                            context.read<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .signInWithGooglePressed());
                          },
                        ),
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
                              new TextSpan(text: 'Dont have an account? '),
                              new TextSpan(
                                  text: 'Register',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        onTap: () =>
                            Navigator.of(context).pushNamed('/register'),
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
