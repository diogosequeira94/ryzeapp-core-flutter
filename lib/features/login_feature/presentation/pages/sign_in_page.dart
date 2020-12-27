import 'package:firebaseblocryze/features/login_feature/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/blocs/sign_in_form/sign_in_form_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/widgets/sign_in_form.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// f45d27
// f5851f

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
