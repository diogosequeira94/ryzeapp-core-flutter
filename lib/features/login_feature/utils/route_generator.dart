import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/pages/register_page.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/pages/sign_in_page.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/pages/splash_screen.dart';
import 'package:firebaseblocryze/repository/bottom_navigation_bar/profile_page_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file:///C:/Users/diogo/OneDrive/Bureau/Flutter%20Projects/firebaseblocryze/lib/features/bottom_navigation_bar/presentation/bottom_nav_bar_widget.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/bottom-nav':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => BottomNavigationBarBloc(
                      profilePageRepository: ProfilePageRepository(),
                    )..add(BottomNavigationHomePagePressed()),
                child: BottomNavBarWidget()));
      case '/login':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
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
