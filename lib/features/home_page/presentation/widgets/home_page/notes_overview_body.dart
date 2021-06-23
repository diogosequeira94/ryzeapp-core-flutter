import 'package:firebaseblocryze/features/home_page/presentation/blocs/note_watcher/note_watcher_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesOverviewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
        builder: (context, state) {
      return state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const Center(child: CircularProgressIndicator()),
        loadSuccess: (state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final note = state.notes[index];
              return Container(color: Colors.green, width: 100, height: 100);
            },
            itemCount: state.notes.length,
          );
        },
        loadFailure: (state) {
          return Container(color: Colors.green, width: 200, height: 200);
        },
      );
    });
  }
}
