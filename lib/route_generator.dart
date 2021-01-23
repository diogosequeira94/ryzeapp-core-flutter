import 'package:firebaseblocryze/features/account/cubit/add_card_form_cubit.dart';
import 'package:firebaseblocryze/features/account/presentation/pages/add_card_page.dart';
import 'package:firebaseblocryze/features/account/presentation/pages/change_password_page.dart';
import 'package:firebaseblocryze/features/account/presentation/pages/error/payment_failed_page.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/presentation/bottom_nav_bar_widget.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/presentation/notifications_page.dart';
import 'package:firebaseblocryze/features/explore/presentation/explore_map_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job_confirmation_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job_hub_page.dart';
import 'package:firebaseblocryze/features/login/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:firebaseblocryze/features/login/presentation/pages/password_reset_page.dart';
import 'package:firebaseblocryze/features/login/presentation/pages/register_page.dart';
import 'package:firebaseblocryze/features/login/presentation/pages/sign_in_page.dart';
import 'package:firebaseblocryze/features/login/presentation/pages/splash_page.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/edit_information_page.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/explore/presentation/explore_overview_page.dart';

class JobHubArguments {
  final List<JobPost> jobPostList;
  final JobsBloc jobsBloc;

  JobHubArguments({this.jobPostList, this.jobsBloc});
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case '/bottom-nav':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => BottomNavigationBarBloc()
                  ..add(BottomNavigationHomePagePressed()),
                child: BottomNavBarWidget()));
      case '/login':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/password-reset':
        return MaterialPageRoute(builder: (_) => PasswordResetPage());
      case '/explore-map':
        return MaterialPageRoute(builder: (_) => ExploreMapPage());
      case '/explore-overview':
        return MaterialPageRoute(builder: (_) => ExploreOverviewPage());
      case '/payment-error':
        return MaterialPageRoute(builder: (_) => PaymentFailedPage());
      case '/notifications':
        return MaterialPageRoute(builder: (_) => NotificationsPage());
      case '/edit-profile':
        return MaterialPageRoute(builder: (_) => EditInformationPage());
      case '/change-password':
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case '/add-card':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => AddCardFormCubit(), child: AddCardPage()));
      case '/job-hub':
        return MaterialPageRoute(builder: (_) {
          final JobHubArguments argument = args;
          return JobHubPage(
              myJobsList: argument.jobPostList, jobsBloc: argument.jobsBloc);
        });
      case '/job-confirmation-page':
        return MaterialPageRoute(
            builder: (_) => JobConfirmationPage(jobPost: args));
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
