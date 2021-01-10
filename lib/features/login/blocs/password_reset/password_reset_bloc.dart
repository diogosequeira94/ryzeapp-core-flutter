import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/login/auth/auth_failure.dart';
import 'package:firebaseblocryze/repository/login/auth/interface_auth_facade.dart';
import 'package:firebaseblocryze/repository/login/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';

part 'password_reset_bloc.freezed.dart';

@injectable
class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  final IAuthFacade _authFacade;
  PasswordResetBloc(this._authFacade) : super(PasswordResetState.initial());

  @override
  Stream<PasswordResetState> mapEventToState(
    PasswordResetEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (event) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(event.email),
          authFailureOrSuccessOption: none(),
        );
      },
      sendPasswordResetEmailPressed: (event) async* {
        print('PRESSED');
        yield* _performActionOnAuthFacadeWithEmail(
          _authFacade.sendPasswordResetEmail,
        );
      },
    );
  }

  Stream<PasswordResetState> _performActionOnAuthFacadeWithEmail(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress email,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;
    final isEmailValid = state.emailAddress.isValid();

    if (isEmailValid) {
      yield state.copyWith(
        isSubmitting: true,
        showErrorMessages: false,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(email: state.emailAddress);
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
