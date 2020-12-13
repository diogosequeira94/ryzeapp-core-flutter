import 'package:firebaseblocryze/features/home_page/presentation/blocs/note_actor/note_actor_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/note_watcher/note_watcher_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
              ..add(const NoteWatcherEvent.watchAllStarted()),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state){
              state.maybeMap(
                unauthenticated: (_) => Navigator.pushReplacementNamed(context, '/login'),
                  orElse: (){},
              );
            },
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state){
              state.maybeMap(
                deleteFailure: (state) {
                  FlushbarHelper
                      .createError(
                      duration: Duration(seconds: 5),
                      message: state.noteFailure.map(
                          unexpected: (_) => 'Unexpected error occured while deleting, please contact support',
                          insufficientPermission: (_) => 'Insufficient permissions',
                          unableToUpdate: (_) => 'Impossible error',
                          unableToDelete: (_) => 'Unable to deleted',
                      ),
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
