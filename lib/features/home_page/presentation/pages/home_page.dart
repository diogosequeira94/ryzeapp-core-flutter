import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/job_post_dummy.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job_creation_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job_detail_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/categories_grid.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/home_page_section_header.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/news_carrousel_slider.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
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
        Future.delayed(const Duration(milliseconds: 1500), (){
          _jobsBloc.add(FetchJobsPosts());
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Job deleted with success'),
            duration: const Duration(milliseconds: 1500),
          ));
        });
      }
    }, builder: (context, state) {
      if (state is JobsFetchInProgress) {
        return Center(child: CircularProgressIndicator());
      } else if (state is JobsFetchSuccess) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'RyzeApp',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(icon: Icon(Icons.notifications_none), onPressed: () {
                Navigator.of(context).pushNamed('/notifications');
              }),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: (){
              _jobsBloc.add(FetchJobsPosts());
              return _jobsBloc.firstWhere((e) => e is !FetchJobsPosts);
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NewsCarouselSliderWidget(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14.0, right: 14.0, top: 20.0, bottom: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Job Posts',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                            child: Icon(Icons.add),
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                        value: BlocProvider.of<JobsBloc>(context),
                                          child: JobCreation())));
                            }),
                      ],
                    ),
                  ),
                  _myJobPosts(state.list, context),
                  HomePageSectionHeader(
                    title: 'Job Categories',
                  ),
                  CategoriesGridWidget(),
                  HomePageSectionHeader(title: 'Trending'),
                  _allJobPosts(context),
                ],
              ),
            ),
          ),
        );
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget _myJobPosts(List jobsList, BuildContext context) {
    return jobsList.isEmpty ? Padding(
      padding: const EdgeInsets.only(left: 14.0, top: 8.0),
      child: Text('You have No Jobs yet.'),
    ) : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: jobsList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(jobsList[index].title),
              subtitle: Text(jobsList[index].city),
              trailing: Text(jobsList[index].hourRate),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobDetailPage(
                              jobPost: jobsList[index],
                            )));
              },
              onLongPress: () {
                AwesomeDialog(
                  context: context,
                  width: 350,
                  buttonsBorderRadius: BorderRadius.all(Radius.circular(2)),
                  headerAnimationLoop: false,
                  animType: AnimType.BOTTOMSLIDE,
                  dialogType: DialogType.NO_HEADER,
                  title: 'Delete Confirmation',
                  desc: 'Are you sure you want to permanently delete this job?',
                  btnCancelText: 'Resume',
                  btnCancelColor: Colors.blueAccent,
                  btnOkText: 'Delete',
                  btnOkColor: Colors.black,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    final _jobsBloc = context.read<JobsBloc>();
                    _jobsBloc.add(DeleteJobPost(jobsList[index]));
                  },
                )..show();
              },
            ),
          );
        },
      ),
    );
  }

  Widget _allJobPosts(BuildContext context) {
    final allJobsMock = DUMMY_ALL_JOBS.map((job) {
      return JobPost(
          jobID: job.jobID,
          title: job.title,
          description: job.description,
          hourRate: job.hourRate,
          imageUrl: job.imageUrl,
          city: job.city,
          isRemote: job.isRemote,
          slotsAvailable: job.slotsAvailable,
          languages: job.languages);
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: allJobsMock.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(allJobsMock[index].title),
              subtitle: Text(allJobsMock[index].city),
              trailing: Text(allJobsMock[index].hourRate),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobDetailPage(
                              jobPost: allJobsMock[index],
                            )));
              },
            ),
          );
        },
      ),
    );
  }
}
