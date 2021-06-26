import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Todo create a new state inside authBloc called firstTime() to redirect to onBoarding page or to Login page

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          firstTimeUser: (_) {
            Navigator.of(context).pushNamed('/onboarding');
          },
          authenticated: (state) {
            print('###### SPLASH USER ID: ${state.userId}');
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/bottom-nav',
              (Route<dynamic> route) => false,
              arguments: state.userId,
            );
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
