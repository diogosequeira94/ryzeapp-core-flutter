import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebaseblocryze/features/home_page/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:firebaseblocryze/repository/note/models/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';

part 'note_form_bloc.freezed.dart';

class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  NoteFormBloc() : super(NoteFormInitial());

  @override
  Stream<NoteFormState> mapEventToState(
    NoteFormEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
