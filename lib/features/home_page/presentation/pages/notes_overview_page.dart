import 'package:firebaseblocryze/features/home_page/presentation/blocs/note_actor/note_actor_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/note_watcher/note_watcher_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/notes_overview_body.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(create: (context) => getIt<NoteWatcherBloc>()
        ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state){
            state.maybeMap(
              unauthenticated: (_){},
              orElse: (){},
            );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) {
              state.maybeMap(
                deleteFailure: (state) {
                  FlushbarHelper.createError(
                    duration: const Duration(seconds: 1),
                    message: 'Error deleting!',
                  ).show(context);
                },
                orElse: (){},
              );
            },
          )
        ],
        child: Scaffold(
              appBar: AppBar(
                title: const Text('Notes'),
                leading: IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: (){
                      context.read<AuthBloc>().add(const AuthEvent.signedOutPressed());
                    },
                ),
                actions: [
                  IconButton(icon: Icon(Icons.indeterminate_check_box),
                    onPressed: () {},
                  ),
                ],
              ),
              body: NotesOverviewBody(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Navigate to NoteFormPagem
                },
                child: Icon(Icons.add),
              ),
            ),
      ),
    );
  }
}
