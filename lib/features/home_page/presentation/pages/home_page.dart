import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/cubit/job_form_cubit.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/job_post_dummy.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/pages.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/home_page/widgets.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/shared/job_card_item.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:firebaseblocryze/route_generator.dart';
import 'package:firebaseblocryze/uikit/widgets/job_status_pill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _jobsBloc = context.watch<JobsBloc>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          automaticallyImplyLeading: false,
          title: Text('RyzeApp',
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color)),
          actions: [
            IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {
                  Navigator.of(context).pushNamed('/notifications');
                }),
            IconButton(
                icon: Icon(Icons.chat_outlined),
                onPressed: () {
                  Navigator.of(context).pushNamed('/messages');
                }),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () {
            _jobsBloc.add(FetchJobsPosts());
            return _jobsBloc.firstWhere((e) => e is! FetchJobsPosts);
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsCarouselSliderWidget(),
                CovidPandemicAlert(showAlert: true),
                BlocConsumer<JobsBloc, JobsState>(
                  listener: (context, state) {
                    if (state is JobsFetchFailure) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Error retrieving data. Please try again"),
                        duration: const Duration(seconds: 2),
                      ));
                    } else if (state is DeleteJobFailure) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(state.message),
                        duration: const Duration(seconds: 2),
                      ));
                    } else if (state is DeleteJobSuccess) {
                      Future.delayed(const Duration(milliseconds: 1500), () {
                        _jobsBloc.add(FetchJobsPosts());
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Job deleted with success'),
                          duration: const Duration(milliseconds: 1500),
                        ));
                      });
                    }
                  },
                  builder: (context, state) {
                    if (state is JobsFetchInProgress) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Center(
                          child: CircularProgressIndicator(
                              backgroundColor:
                                  Theme.of(context).accentColor),
                        ),
                      );
                    } else if (state is JobsFetchSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0,
                                right: 14.0,
                                top: 20.0,
                                bottom: 6.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => MultiBlocProvider(providers: [
                                    BlocProvider.value(
                                        value:
                                            BlocProvider.of<JobsBloc>(context)),
                                    BlocProvider(create: (_) => JobFormCubit())
                                  ], child: JobCreation()),
                                ));
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Your Job Posts',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(Icons.add),
                                ],
                              ),
                            ),
                          ),
                          _myJobPosts(state.myJobs, context),
                          HomePageSectionHeader(
                            title: 'Job Categories',
                            edgeInsets:
                                const EdgeInsets.fromLTRB(14.0, 4.0, 14.0, 6.0),
                          ),
                          CategoriesGridWidget(),
                          HomePageSectionHeader(title: 'Trending'),
                          _mockTrendingJobPosts(context, 3),
                          HomePageSectionHeader(title: 'Most Recent'),
                          _allJobsList(context, state.jobsList),
                        ],
                      );
                    } else if (state is JobsFetchFailure) {
                      return Center(
                        child: Text(
                            'Something went wrong... please reload the page'),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget _myJobPosts(List jobsList, BuildContext context) {
    return jobsList.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 8.0, bottom: 8.0),
            child: Text('You have no Jobs Posts yet.'),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
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
                      confirmDismiss:
                          (DismissDirection dismissDirection) async {
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
                                    builder: (_) => BlocProvider.value(
                                          value: context.watch<JobsBloc>(),
                                          child: JobDetailPage(
                                            selfViewing: true,
                                            jobPost: jobsList[index],
                                          ),
                                        )));
                          },
                          onLongPress: () {
                            _showDeleteConfirmationDialog(
                                context, jobsList[index]);
                          },
                        ),
                      ),
                    );
                  },
                ),
                jobsList.length > 2
                    ? GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, right: 6.0),
                          child: Container(
                            height: 25.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text('See All'),
                                SizedBox(width: 4.0),
                                Icon(Icons.arrow_forward, size: 18.0),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed('/job-hub',
                              arguments: JobHubArguments(
                                jobPostList: jobsList,
                                jobsBloc: context.read<JobsBloc>(),
                              ));
                        },
                      )
                    : SizedBox.shrink(),
              ],
            ),
          );
  }

  Widget _allJobsList(BuildContext context, List<JobPost> jobsList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: jobsList.length,
        itemBuilder: (context, index) {
          final jobPost = jobsList[index];
          return JobCardItem(jobPost);
        },
      ),
    );
  }

  Widget _mockTrendingJobPosts(BuildContext context, [int length]) {
    final allJobsMock = DUMMY_ALL_JOBS.map((job) {
      return JobPost(
          posterName: 'RyzeApp',
          posterID: 'RyzeApp',
          jobID: job.jobID,
          title: job.title,
          startDate: job.startDate,
          endDate: job.endDate,
          startTime: job.startTime,
          endTime: job.endTime,
          description: job.description,
          status: 'Active',
          hourRate: job.hourRate,
          imageUrl: job.imageUrl,
          city: job.city,
          isRemote: job.isRemote,
          slotsAvailable: job.slotsAvailable,
          additionalInfo: 'Please arrive 15 minutes earlier.',
          maxCandidates: 1,
          currentProposals: 0,
          languages: job.languages);
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: length ?? allJobsMock.length,
        itemBuilder: (context, index) {
          final jobPost = allJobsMock[index];
          return JobCardItem(jobPost);
        },
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
      padding: const EdgeInsets.all(8.0),
      btnCancelText: 'Resume',
      btnCancelColor: Colors.blueAccent,
      btnOkText: 'Delete',
      btnOkColor: Colors.black,
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        final _jobsBloc = context.read<JobsBloc>();
        _jobsBloc.add(DeleteJobPost(jobPost));
      },
    )..show();
  }
}
