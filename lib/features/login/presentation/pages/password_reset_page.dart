import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login/blocs/password_reset/password_reset_bloc.dart';
import 'package:firebaseblocryze/features/login/presentation/widgets/sign_in_header.dart';
import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordResetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<PasswordResetBloc>(),
          ),
        ],
        child: BlocConsumer<PasswordResetBloc, PasswordResetState>(
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
                      invalidCredentials: (_) =>
                          LoginStrings.invalidCredentials,
                    ),
                  ).show(context);
                },
                (_) {
                  Navigator.of(context).pop();
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                                  child: Text('Find your account', style: TextStyle(fontSize: 24.0),),
                                ),
                                Text('Enter your e-mail or phone number associated to your account, we will contact you shortly after.', style: TextStyle(fontSize: 16.0),),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: LoginStrings.textFieldEmailLabel,
                            ),
                            autocorrect: false,
                            onChanged: (value) => context
                                .read<PasswordResetBloc>()
                                .add(PasswordResetEvent.emailChanged(value)),
                            validator: (_) => context
                                .read<PasswordResetBloc>()
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
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 20.0),
                            child: RyzePrimaryButton(
                                title: 'Send',
                                action: () {
                                  context.read<PasswordResetBloc>().add(
                                      PasswordResetEvent
                                          .sendPasswordResetEmailPressed());
                                },
                                isLoading: state.isSubmitting,
                                isAffirmative: true),
                          ),
                          Center(
                              child: InkWell(
                            child: Text(
                              'Still need help?',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            onTap: () => state.isSubmitting
                                ? {}
                                : Navigator.of(context).pop(),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
