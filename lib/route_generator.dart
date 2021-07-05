import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/features/account/cubit/add_card_form_cubit.dart';
import 'package:firebaseblocryze/features/account/presentation/pages/add_card_page.dart';
import 'package:firebaseblocryze/features/account/presentation/pages/change_password_page.dart';
import 'package:firebaseblocryze/features/account/presentation/pages/error/payment_failed_page.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:firebaseblocryze/features/notification_center/bloc/notifications/notifications_bloc.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/presentation/bottom_nav_bar_widget.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/presentation/chat_messages_page.dart';
import 'package:firebaseblocryze/features/notification_center/presentation/notifications_page.dart';
import 'package:firebaseblocryze/features/explore/presentation/explore_map_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/login/presentation/pages/onboarding/onboarding_screen.dart';
import 'package:firebaseblocryze/features/shared/pages/job_category_page.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/cubit/user_preview/user_preview_cubit.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/pages/user_preview_page.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:firebaseblocryze/repository/applications_notifier/applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/repository/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/check_in/presentation/pages/qr_code_page.dart';
import 'features/explore/presentation/explore_overview_page.dart';
import 'features/home_page/presentation/pages/pages.dart';
import 'features/login/presentation/pages/pages.dart';
import 'features/notification_center/bloc/jobs_fetcher/jobs_fetcher_cubit.dart';
import 'features/user_profile/presentation/user_profile/pages/pages.dart';
import 'repository/job_posts/job_repository.dart';

class JobHubArguments {
  final List<JobPost> jobPostList;
  final JobsBloc jobsBloc;

  JobHubArguments({this.jobPostList, this.jobsBloc});
}

class JobCategoryListArguments {
  final List<JobPost> jobPostList;
  final String categoryTitle;

  JobCategoryListArguments({this.jobPostList, this.categoryTitle});
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
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (_) => BottomNavigationBarBloc()
                      ..add(BottomNavigationHomePagePressed()),
                  ),
                  BlocProvider.value(
                    value: BlocProvider.of<UserBloc>(context)
                      ..add(UserProfileFetched(userId: args)),
                  ),
                ], child: BottomNavBarWidget()));
      // Region Login
      case '/login':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/password-reset':
        return MaterialPageRoute(builder: (_) => PasswordResetPage());
      // Region Explore
      case '/explore-map':
        return MaterialPageRoute(builder: (_) => ExploreMapPage());
      case '/explore-overview':
        return MaterialPageRoute(builder: (_) => ExploreOverviewPage());
      // Region Job
      case '/job-hub':
        return MaterialPageRoute(builder: (_) {
          final JobHubArguments argument = args;
          return JobHubPage(
              myJobsList: argument.jobPostList, jobsBloc: argument.jobsBloc);
        });
      case '/job-category-list':
        final JobCategoryListArguments argument = args;
        return MaterialPageRoute(
            builder: (_) =>
                JobCategoryPage(argument.categoryTitle, argument.jobPostList));
      case '/job-confirmation-page':
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (_) => JobsFetcherCubit(
                      JobRepository(
                        FirebaseFirestore.instance,
                        FirebaseStorage.instance,
                      ),
                    )..fetchSingleJob(args),
                child: JobConfirmationPage(jobId: args)));
      // Region Notifications
      case '/notifications':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => NotificationsBloc(
                      ApplicationsNotifierRepository(
                        fireStore: getIt<FirebaseFirestore>(),
                        firebaseStorage: getIt<FirebaseStorage>(),
                      ),
                    )..add(FetchNotifications()),
                child: NotificationsPage()));
      case '/application-profile-preview':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => UserPreviewCubit(
              UserRepository(
                fireStore: getIt<FirebaseFirestore>(),
                firebaseStorage: getIt<FirebaseStorage>(),
              ),
            )..fetchUserProfilePreview(args),
            child: UserPreviewPage(),
          ),
        );
      case '/messages':
        return MaterialPageRoute(builder: (_) => ChatMessagesPage());
      case '/edit-profile':
        return MaterialPageRoute(builder: (_) => EditInformationPage(args));
      case '/qrcode-generator':
        return MaterialPageRoute(builder: (_) => QrCodePage(args));
      // Region Account
      case '/change-password':
        return MaterialPageRoute(builder: (_) => ChangePassword());
      case '/payment-error':
        return MaterialPageRoute(builder: (_) => PaymentFailedPage());
      case '/add-card':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => AddCardFormCubit(), child: AddCardPage()));
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
