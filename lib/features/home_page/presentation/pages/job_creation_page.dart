import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/creation_page/job_creation_form.dart';
import 'package:firebaseblocryze/features/home_page/utils/job_post_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          JobPostStrings.jobCreationPageTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: BlocListener<JobsBloc, JobsState>(
        listener: (context, state) {
          print(state.toString());
          if (state is AddJobFailure) {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is AddJobSuccess) {
            Scaffold.of(context).showSnackBar(SnackBar(
              duration: const Duration(milliseconds: 1500),
              content: Text('Success! Your job was created'),
            ));
            Navigator.pop(context);
          }
        },
        child: JobForm(),
      ),
    );
  }
}
