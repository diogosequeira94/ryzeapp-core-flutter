import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/repository/login/auth/auth_failure.dart';
import 'package:firebaseblocryze/repository/login/auth/interface_auth_facade.dart';
import 'package:firebaseblocryze/repository/login/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'register_event.dart';
part 'register_state.dart';

part 'register_bloc.freezed.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IAuthFacade _authFacade;
  RegisterBloc(this._authFacade) : super(RegisterState.initial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    yield* event.map(emailChanged: (event) async* {
      yield state.copyWith(
        emailAddress: EmailAddress(event.email),
        authFailureOrSuccessOption: none(),
      );
    }, passwordChanged: (event) async* {
      yield state.copyWith(
        password: Password(event.password),
        authFailureOrSuccessOption: none(),
      );
    }, firstNameChanged: (event) async* {
      yield state.copyWith(
        firstName: FirstName(event.firstName),
        authFailureOrSuccessOption: none(),
      );
    }, lastNameChanged: (event) async* {
      yield state.copyWith(
        lastName: LastName(event.lastName),
        authFailureOrSuccessOption: none(),
      );
    }, registerWithEmailAndPasswordPressed: (event) async* {
      yield* _performActionOnAuthFacadeWithEmailAndPassword(
        _authFacade.registerWithEmailAndPassword,
      );
    });
  }

  Stream<RegisterState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailure, Unit>> Function({
      @required EmailAddress email,
      @required Password password,
      @required FirstName firstName,
      @required LastName lastName,
    })
        forwardedCall,
  ) async* {
    Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    final isFirstNameValid = state.firstName.isValid();
    final isLastNameValid = state.lastName.isValid();

    if (isEmailValid &&
        isPasswordValid &&
        isFirstNameValid &&
        isLastNameValid) {
      yield state.copyWith(
        isSubmitting: true,
        showErrorMessages: false,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
          email: state.emailAddress,
          firstName: state.firstName,
          lastName: state.lastName,
          password: state.password);
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
