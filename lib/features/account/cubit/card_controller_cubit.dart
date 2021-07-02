import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'card_controller_state.dart';

class CardControllerCubit extends Cubit<CardControllerState> {
  CardControllerCubit() : super(CardControllerInitial());
}
