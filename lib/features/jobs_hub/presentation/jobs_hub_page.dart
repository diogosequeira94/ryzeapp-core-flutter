import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/cubit/job_form_cubit.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job/job_creation_page.dart';
import 'package:firebaseblocryze/features/jobs_hub/cubit/my_jobs_cubit.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
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
            _buildActiveList(context),
            _buildCompleteList(),
            _buildMyPostsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveList(BuildContext context) {
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
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: state.applications.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            title: Text(state.applications[index].jobTitle),
                            subtitle: Text(
                                state.applications[index].dateOfApplication),
                            onTap: () {},
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

  Widget _buildCompleteList() {
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

  Widget _buildMyPostsList(BuildContext context) {
    return Center(
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
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
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
    );
  }

  _showDeleteNotificationsDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      width: 350,
      buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.NO_HEADER,
      title: 'Delete Notifications',
      desc:
          'Are you sure you want to delete all notifications? You can choose to delete each one by longpressing an entry.',
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      btnCancelText: 'Go back',
      btnCancelColor: Colors.black,
      btnOkText: 'Delete',
      btnOkColor: Colors.red,
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  _buildNotificationMock(BuildContext context) {
    final jobPost = JobPost(
        jobID: '213213',
        title: 'Mock Job',
        description: 'This is a Mock Job, not Real. Do not Work for free',
        imageUrl: null,
        status: 'Active',
        city: 'Lisbon',
        hourRate: '20€ / hour',
        isRemote: true,
        slotsAvailable: 1,
        languages: ['Portuguese']);
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          child: Card(
            elevation: 3.0,
            child: ListTile(
              title: Text('Mock'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JobStatusPill(jobStatus: 'Active'),
                ],
              ),
              onTap: () {
                Navigator.popAndPushNamed(context, '/job-confirmation-page',
                    arguments: jobPost);
              },
            ),
          ),
        ),
        Divider(
          height: 1.0,
        ),
      ],
    );
  }
}
