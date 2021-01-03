import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            Navigator.of(context).pushNamed('/bottom-nav');
          },
          unauthenticated: (_) {
            Navigator.of(context).pushNamed('/login');
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
