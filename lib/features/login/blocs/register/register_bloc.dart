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
    // TODO: implement mapEventToState
  }
}
