// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'features/home_page/presentation/blocs/note_actor/note_actor_bloc.dart'
    as _i13;
import 'features/home_page/presentation/blocs/note_watcher/note_watcher_bloc.dart'
    as _i14;
import 'features/login/blocs/auth/auth_bloc.dart' as _i18;
import 'features/login/blocs/password_reset/password_reset_bloc.dart' as _i15;
import 'features/login/blocs/register/register_bloc.dart' as _i16;
import 'features/login/blocs/sign_in_form/sign_in_form_bloc.dart' as _i17;
import 'platform/core_helpers/firebase_injectable_module.dart' as _i19;
import 'repository/job_posts/i_job_post_repository.dart' as _i9;
import 'repository/job_posts/job_repository.dart' as _i10;
import 'repository/login/auth/interface_auth_facade.dart' as _i7;
import 'repository/login/infrastructure/auth/firebase_auth_facade.dart' as _i8;
import 'repository/note/i_note_repository.dart' as _i11;
import 'repository/note/note_repository.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseFireStore);
  gh.lazySingleton<_i5.FirebaseStorage>(
      () => firebaseInjectableModule.firebaseStorage);
  gh.lazySingleton<_i6.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i7.IAuthFacade>(() => _i8.FirebaseAuthFacade(
      get<_i3.FirebaseAuth>(),
      get<_i4.FirebaseFirestore>(),
      get<_i6.GoogleSignIn>()));
  gh.lazySingleton<_i9.IJobPostRepository>(() => _i10.JobRepository(
      get<_i4.FirebaseFirestore>(), get<_i5.FirebaseStorage>()));
  gh.lazySingleton<_i11.INoteRepository>(
      () => _i12.NoteRepository(get<_i4.FirebaseFirestore>()));
  gh.factory<_i13.NoteActorBloc>(
      () => _i13.NoteActorBloc(get<_i11.INoteRepository>()));
  gh.factory<_i14.NoteWatcherBloc>(
      () => _i14.NoteWatcherBloc(get<_i11.INoteRepository>()));
  gh.factory<_i15.PasswordResetBloc>(
      () => _i15.PasswordResetBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i16.RegisterBloc>(
      () => _i16.RegisterBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i17.SignInFormBloc>(
      () => _i17.SignInFormBloc(get<_i7.IAuthFacade>()));
  gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(get<_i7.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i19.FirebaseInjectableModule {}
