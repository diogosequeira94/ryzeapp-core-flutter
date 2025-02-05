import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login/blocs/sign_in_form/sign_in_form_bloc.dart';
import 'package:firebaseblocryze/features/login/presentation/widgets/sign_in_form.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<SignInFormBloc>(),
          ),
        ],
          child: SignInForm()
      ),
    );
  }
}
