import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/features/login_feature/domain/auth/auth_failure.dart';
import 'package:firebaseblocryze/features/login_feature/domain/auth/interface_auth_facade.dart';
import 'package:firebaseblocryze/features/login_feature/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(

      emailChanged: (event) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(event.email),
          authFailureOrSuccessOption: none(),
        );
      },

      passwordChanged: (event) async* {
        yield state.copyWith(
          password: Password(event.password),
          authFailureOrSuccessOption: none(),
        );
      },

      registerWithEmailAndPasswordPressed: (event) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(_authFacade.registerWithEmailAndPassword,
        );
      },

      signInWithEmailAndPasswordPressed: (event) async* {
        yield* _performActionOnAuthFacadeWithEmailAndPassword(_authFacade.signInWithEmailAndPassword,
        );
      },

      signInWithGooglePressed: (event) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        final failureOrSuccess = await _authFacade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        );
      },
    );
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress email,
      @required Password password,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
          email: state.emailAddress, password: state.password);
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
