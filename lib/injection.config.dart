// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:cloud_firestore/cloud_firestore.dart';
// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'features/login/blocs/auth/auth_bloc.dart';
import 'features/login/blocs/password_reset/password_reset_bloc.dart';
import 'features/login/blocs/register/register_bloc.dart';
import 'features/login/blocs/sign_in_form/sign_in_form_bloc.dart';
import 'repository/job_posts/i_job_post_repository.dart';
import 'repository/job_posts/job_repository.dart';
import 'repository/login/auth/interface_auth_facade.dart';
import 'repository/login/infrastructure/auth/firebase_auth_facade.dart';
import 'repository/login/infrastructure/core/firebase_injectable_module.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<FirebaseAuth>(() => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<Firestore>(() => firebaseInjectableModule.firebaseFireStore);
  gh.lazySingleton<FirebaseStorage>(() => firebaseInjectableModule.firebaseStorage);
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(() => FirebaseAuthFacade(
        get<FirebaseAuth>(),
        get<Firestore>(),
        get<GoogleSignIn>(),
      ));
  gh.lazySingleton<IJobPostRepository>(() => JobRepository(get<Firestore>(), get<FirebaseStorage>()));
  gh.factory<PasswordResetBloc>(() => PasswordResetBloc(get<IAuthFacade>()));
  gh.factory<RegisterBloc>(() => RegisterBloc(get<IAuthFacade>()));
  gh.factory<SignInFormBloc>(() => SignInFormBloc(get<IAuthFacade>()));
  gh.factory<AuthBloc>(() => AuthBloc(get<IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
