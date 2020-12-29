import 'package:firebaseblocryze/features/home_page/presentation/pages/home_page.dart';
import 'package:firebaseblocryze/features/login_feature/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/settings/presentation/pages/settings_overview_page.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile_page.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
            builder: (_) => HomePage());
      case '/user-profile':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => getIt<AuthBloc>(), child: UserProfilePage()));
      case '/settings':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => getIt<AuthBloc>(), child: SettingsOverviewPage()));
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
