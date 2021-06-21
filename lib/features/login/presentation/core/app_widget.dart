import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:firebaseblocryze/repository/user/user_repository.dart';
import 'package:firebaseblocryze/route_generator.dart';
import 'package:firebaseblocryze/uikit/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckFirstTimeUser()),
        ),
        BlocProvider(create: (context) {
          return UserBloc(
            userRepository: UserRepository(
                fireStore: getIt<Firestore>(),
                firebaseStorage: getIt<FirebaseStorage>()),
          );
        }),
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'RyzeApp',
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}
