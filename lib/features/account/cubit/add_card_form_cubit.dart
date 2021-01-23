import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_card_form_state.dart';

class AddCardFormCubit extends Cubit<AddCardFormState> {
  AddCardFormCubit() : super(AddCardFormInitial());
}
