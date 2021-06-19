import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';
import 'package:firebaseblocryze/repository/login/auth/interface_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

// Injects AuthBloc or find it with GetIn, and the constructor its passed the correct instances.
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade) : super(const AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    // yield each because we want to map the incoming events (a freezed union)
    yield* event.map(
      authCheckFirstTimeUser: (e) async* {
        final isFirstTimeUser = sharedPrefs.isFirstTimeInApp;
        if (isFirstTimeUser) {
          yield const AuthState.firstTimeUser();
        } else {
          add(const AuthEvent.authCheckRequested());
        }
      },
      authCheckRequested: (e) async* {
        final userOption = await _authFacade.getSignedInUser();
        yield userOption.fold(() => const AuthState.unauthenticated(), (user) {
          print('####### LOG ####### User Id: ${user.id}');
          return const AuthState.authenticated();
        });
      },
      signedOutPressed: (e) async* {
        await _authFacade.signOut();
        yield const AuthState.unauthenticated();
      },
    );
  }
}
