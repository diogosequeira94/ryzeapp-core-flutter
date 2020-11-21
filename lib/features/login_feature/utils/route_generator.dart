import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/bottom_nav_bar_widget.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/repositories/home_page_repository.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/repositories/profile_page_repository.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/pages/sign_in_screen.dart';
import 'package:firebaseblocryze/features/login_feature/presentation/pages/splash_screen.dart';
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
      case '/bottom-nav':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => BottomNavigationBarBloc(
                      homePageRepository: HomePageRepository(),
                      profilePageRepository: ProfilePageRepository(),
                    )..add(BottomNavigationHomePagePressed()),
                child: BottomNavBarWidget()));
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
