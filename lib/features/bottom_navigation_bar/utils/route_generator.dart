import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/features/account/presentation/pages/account_overview_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/home_page.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/pages/user_profile_page.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:firebaseblocryze/repository/job_posts/job_repository.dart';
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
            builder: (_) => BlocProvider(
                create: (_) => JobsBloc(
                    JobRepository(Firestore.instance, FirebaseStorage.instance))
                  ..add(FetchJobsPosts()),
                child: HomePage()));
      case '/user-profile':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => getIt<AuthBloc>(), child: UserProfilePage()));
      case '/settings':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => getIt<AuthBloc>(),
                child: AccountOverviewPage()));
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
