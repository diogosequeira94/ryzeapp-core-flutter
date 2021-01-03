// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/login/blocs/auth/auth_bloc.dart';
import 'repository/login/infrastructure/auth/firebase_auth_facade.dart';
import 'repository/login/infrastructure/core/firebase_injectable_module.dart';
import 'repository/login/auth/interface_auth_facade.dart';
import 'repository/job_posts/i_job_post_repository.dart';
import 'repository/note/i_note_repository.dart';
import 'repository/job_posts/job_repository.dart';
import 'features/home_page/presentation/blocs/note_actor/note_actor_bloc.dart';
import 'features/home_page/presentation/blocs/note_form/note_form_bloc.dart';
import 'repository/note/note_repository.dart';
import 'features/home_page/presentation/blocs/note_watcher/note_watcher_bloc.dart';
import 'features/login/blocs/sign_in_form/sign_in_form_bloc.dart';

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
  gh.lazySingleton<GoogleSignIn>(() => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<IAuthFacade>(
      () => FirebaseAuthFacade(get<FirebaseAuth>(), get<GoogleSignIn>()));
  gh.lazySingleton<IJobPostRepository>(() => JobRepository(get<Firestore>()));
  gh.lazySingleton<INoteRepository>(() => NoteRepository(get<Firestore>()));
  gh.factory<NoteActorBloc>(() => NoteActorBloc(get<INoteRepository>()));
  gh.factory<NoteFormBloc>(() => NoteFormBloc(get<INoteRepository>()));
  gh.factory<NoteWatcherBloc>(() => NoteWatcherBloc(get<INoteRepository>()));
  gh.factory<SignInFormBloc>(() => SignInFormBloc(get<IAuthFacade>()));
  gh.factory<AuthBloc>(() => AuthBloc(get<IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
