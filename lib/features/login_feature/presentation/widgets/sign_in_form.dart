import 'package:firebaseblocryze/features/login_feature/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/blocs/sign_in_form/sign_in_form_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/widgets/sign_in_header.dart';
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
              Navigator.of(context).pushReplacementNamed('/bottom-nav');
              context.bloc<AuthBloc>()
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
                                    invalidEmail: (_) => LoginStrings.textFieldEmailError,
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
                                    shortPassword: (_) => LoginStrings.textFieldPasswordError,
                                    orElse: () => null),
                                (_) => null),
                      ),
                      const SizedBox(height: 16.0),
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
                                Navigator.of(context).pushReplacementNamed('/register');
                              },
                              child: const Text(LoginStrings.registerButton),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32.0),
                      InkWell(
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF3229bf),
                                Color(0xFF4568ff),
                            ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Center(
                            child: const Text(
                              LoginStrings.signInGoogleButton,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        onTap:() {
                          context.read<SignInFormBloc>().add(
                            const SignInFormEvent.signInWithGooglePressed(),
                          );
                        },
                      ),
                      if (state.isSubmitting)...[
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
