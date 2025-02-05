import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:firebaseblocryze/repository/applications_notifier/applications_notifier_repository.dart';
import 'package:firebaseblocryze/repository/user/user_repository.dart';
import 'package:firebaseblocryze/route_generator.dart';
import 'package:firebaseblocryze/uikit/theme/app_themes.dart';
import 'package:firebaseblocryze/uikit/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'platform/l10n/l10n.dart';
import 'repository/job_posts/job_repository.dart';

class ShellWidget extends StatefulWidget {
  @override
  _ShellWidgetState createState() => _ShellWidgetState();
}

class _ShellWidgetState extends State<ShellWidget> {
  AuthBloc _authBloc;
  JobsBloc _jobsBloc;
  UserBloc _userBloc;
  ThemeBloc _themeBloc;

  @override
  void initState() {
    super.initState();
    _initializeBlocs();
  }

  void _initializeBlocs() {
    _authBloc = getIt<AuthBloc>();
    _jobsBloc = JobsBloc(
      jobRepository: JobRepository(
        FirebaseFirestore.instance,
        FirebaseStorage.instance,
      ),
      applicationsNotifierRepository: ApplicationsNotifierRepository(
        fireStore: FirebaseFirestore.instance,
        firebaseStorage: FirebaseStorage.instance,
      ),
    );
    _userBloc = UserBloc(
      userRepository: UserRepository(
          fireStore: getIt<FirebaseFirestore>(),
          firebaseStorage: getIt<FirebaseStorage>()),
    );
    _themeBloc = ThemeBloc();
  }

  List<BlocProvider> _buildBlocProviders() {
    final bool isDarkModeSelected = sharedPrefs.isDarkModeSelected;
    final defaultShellBlocProviders = <BlocProvider>[
      BlocProvider<AuthBloc>(
        lazy: false,
        create: (context) =>
            _authBloc..add(const AuthEvent.authCheckFirstTimeUser()),
      ),
      BlocProvider<UserBloc>(
        create: (context) => _userBloc,
      ),
      BlocProvider<JobsBloc>(
        create: (context) => _jobsBloc..add(FetchJobsPosts()),
      ),
      BlocProvider<ThemeBloc>(
        create: (context) => _themeBloc
          ..add(
            isDarkModeSelected
                ? ThemeChanged(theme: AppTheme.DarkRed)
                : ThemeChanged(theme: AppTheme.ClassicBlue),
          ),
      ),
    ];
    return defaultShellBlocProviders;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _buildBlocProviders(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'RyzeApp',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          //  supportedLocales: L10n.all,
          );
        },
      ),
    );
  }
}
