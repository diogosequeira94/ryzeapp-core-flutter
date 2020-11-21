import 'package:firebaseblocryze/features/home_page/presentation/pages/home_page.dart';
import 'package:firebaseblocryze/features/login_feature/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/pages/sign_in_screen.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/pages/splash_screen.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (_) => getIt<AuthBloc>(),
            child: HomePage()));
      case '/login':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => SignInPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
