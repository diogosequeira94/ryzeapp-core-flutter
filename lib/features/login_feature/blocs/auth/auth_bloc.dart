import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebaseblocryze/features/login_feature/domain/auth/interface_auth_facade.dart';
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
      authCheckRequested: (e) async* {
        final userOption = await _authFacade.getSignedInUser();
        yield userOption.fold(
          () => const AuthState.unauthenticated(),
          (_) => const AuthState.authenticated(),
        );
      },
      signedOutPressed: (e) async* {
        await _authFacade.signOut();
        yield const AuthState.unauthenticated();
        print('This was called');
      },
    );
  }
}
