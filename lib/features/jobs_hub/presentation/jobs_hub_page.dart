import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/cubit/job_form_cubit.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job/job_creation_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job/job_detail_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/home_page/widgets.dart';
import 'package:firebaseblocryze/features/jobs_hub/cubit/my_jobs_cubit.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/notification_center/bloc/jobs_fetcher/jobs_fetcher_cubit.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/uikit/widgets/job_status_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class JobsHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userId = BlocProvider.of<AuthBloc>(context).userId;
    final myJobsCubit = BlocProvider.of<MyJobsCubit>(context);
    myJobsCubit.fetchMyApplications(userId);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.list),
            ),
          ],
          bottom: TabBar(
            indicatorWeight: 3.0,
            tabs: [
              Tab(
                  child: Text(
                'Active',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).textTheme.headline6.color),
              )),
              Tab(
                  child: Text(
                'Completed',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).textTheme.headline6.color),
              )),
              Tab(
                  child: Text(
                'My Posts',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Theme.of(context).textTheme.headline6.color),
              )),
            ],
          ),
          title: Text('Jobs Hub',
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color)),
        ),
        body: TabBarView(
          children: [
            _ActiveJobsTab(),
            _CompletedJobsTab(),
            _MyJobsTab(),
          ],
        ),
      ),
    );
  }
}

class _ActiveJobsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyJobsCubit, MyJobsState>(
      builder: (context, state) {
        if (state is FetchMyApplicationsSuccess) {
          return state.applications.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.work_off_outlined,
                        size: 80, color: Colors.black45),
                    const SizedBox(height: 24.0),
                    Text('You have no active jobs ongoing',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 10.0),
                    Text(
                        'When you have jobs updates or posts, everything will be displayed here.',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                      activeColor: Theme.of(context).accentColor,
                      contentPadding:
                          const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 0.0),
                      value: false,
                      title: Text('Hide unsuccessful applications'),
                      onChanged: (isChecked) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
                      child: Text(
                        'Sent (${state.applications.length})',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.applications.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            title: Text(state.applications[index].jobTitle),
                            subtitle: Text(
                                state.applications[index].dateOfApplication),
                            onTap: () {
                              // Take me to details
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        } else if (state is FetchMyApplicationsInProgress) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).accentColor,
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}

class _CompletedJobsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.work_off_outlined, size: 80, color: Colors.black45),
            const SizedBox(height: 24.0),
            Text('No jobs completed',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
            const SizedBox(height: 10.0),
            Text('When you complete a job, the details will be displayed here.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _MyJobsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _jobsBloc = context.watch<JobsBloc>();
    return BlocConsumer<JobsBloc, JobsState>(listener: (context, state) {
      if (state is JobsFetchFailure) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Error retrieving data. Please try again"),
          duration: const Duration(seconds: 2),
        ));
      } else if (state is DeleteJobFailure) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(state.message),
          duration: const Duration(seconds: 2),
        ));
      } else if (state is DeleteJobSuccess) {
        Future.delayed(const Duration(milliseconds: 250), () {
          _jobsBloc.add(FetchJobsPosts());
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Job deleted with success'),
            duration: const Duration(milliseconds: 1250),
          ));
        });
      }
    }, builder: (context, state) {
      if (state is JobsFetchSuccess) {
        return state.myJobs.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.add_circle_outline,
                            size: 80, color: Colors.black45),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => MultiBlocProvider(providers: [
                              BlocProvider.value(
                                  value: BlocProvider.of<JobsBloc>(context)),
                              BlocProvider(create: (_) => JobFormCubit())
                            ], child: JobCreation()),
                          ));
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Text('You have not posted any jobs yet',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 10.0),
                      Text(
                          'If you would like to add a job post, click in the icon above.',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              )
            : _MyJobsList(state.myJobs);
      } else if (state is FetchSingleJobFailure) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.error_outline_rounded,
                    size: 80, color: Colors.black45),
                const SizedBox(height: 24.0),
                Text('Something went wrong',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
                const SizedBox(height: 10.0),
                Text(
                    'Looks like something went wrong with your request, we are sorry for the inconvenience',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).accentColor,
          ),
        );
      }
    });
  }
}

class _MyJobsList extends StatelessWidget {
  final List jobsList;
  _MyJobsList(this.jobsList);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: jobsList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key('${jobsList[index]}'),
                  direction: DismissDirection.horizontal,
                  background: JobDismissBackground(
                      bgColor: Colors.lightGreen,
                      icon: Icons.edit_outlined,
                      iconAlignment: Alignment.centerLeft),
                  secondaryBackground: JobDismissBackground(
                      bgColor: Color(0xFFDD0000),
                      icon: Icons.delete_outlined,
                      iconAlignment: Alignment.centerRight),
                  confirmDismiss: (DismissDirection dismissDirection) async {
                    switch (dismissDirection) {
                      case DismissDirection.endToStart:
                        return await _showDeleteConfirmationDialog(
                            context, jobsList[index]);
                      case DismissDirection.startToEnd:
                        return false;
                      default:
                        return false;
                    }
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(jobsList[index].title),
                      subtitle: Text(jobsList[index].city),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(jobsList[index].hourRate),
                          JobStatusPill(jobStatus: jobsList[index].status),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => JobDetailPage(
                                      selfViewing: true,
                                      jobPost: jobsList[index],
                                    )));
                      },
                      onLongPress: () {
                        _showDeleteConfirmationDialog(context, jobsList[index]);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _showDeleteConfirmationDialog(BuildContext context, JobPost jobPost) {
    AwesomeDialog(
      context: context,
      width: 350,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.NO_HEADER,
      title: 'Delete Confirmation',
      desc: 'Are you sure you want to permanently delete this job?',
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      btnCancelText: 'Resume',
      btnCancelColor: Colors.black,
      btnOkText: 'Delete',
      btnOkColor: Colors.red,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        final _jobsBloc = context.read<JobsBloc>();
        _jobsBloc.add(DeleteJobPost(jobPost));
      },
    )..show();
  }
}
