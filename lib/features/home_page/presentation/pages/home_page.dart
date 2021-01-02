import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/job_post_dummy.dart';
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
    return BlocConsumer<JobsBloc, JobsState>(
      listener: (context, state){
        if (state is JobsFetchFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Error retrieving data. Please try again"),
            duration: const Duration(seconds: 2),
          ));
        }
      },
        builder: (context, state) {
      if (state is JobsFetchInProgress) {
        return Center(child: CircularProgressIndicator());
      } else if (state is JobsFetchSuccess) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8.0),
              NewsCarouselSliderWidget(),
              const SizedBox(height: 8.0),
              HomePageSectionHeader(title: 'Your Job Posts', hasAction: true),
              _myJobPosts(state.list, context),
              HomePageSectionHeader(title: 'Job Categories', hasAction: false),
              const SizedBox(height: 8.0),
              CategoriesGridWidget(),
              const SizedBox(height: 8.0),
              HomePageSectionHeader(title: 'Trending', hasAction: false),
              _allJobPosts(context),
            ],
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
    return Padding(
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
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Job deleted with success."),
                      duration: const Duration(seconds: 1),
                    ));
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
