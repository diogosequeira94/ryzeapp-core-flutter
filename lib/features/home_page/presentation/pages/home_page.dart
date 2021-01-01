import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/job_model.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/job_post_dummy.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job_detail_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/categories_grid.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/home_page_section_header.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/news_carrousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          NewsCarouselSliderWidget(),
          const SizedBox(height: 8.0),
          HomePageSectionHeader(title: 'Your Job Posts'),
          _myJobPosts(context),
          HomePageSectionHeader(title: 'Job Categories'),
          const SizedBox(height: 8.0),
          CategoriesGridWidget(),
          const SizedBox(height: 8.0),
          HomePageSectionHeader(title: 'Trending'),
          _allJobPosts(context),
        ],
      ),
    );
  }

  Widget _myJobPosts(BuildContext context) {
    final myJobsMock = DUMMY_MY_JOBS.map((job) {
      return JobPostModel(
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
        itemCount: myJobsMock.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(myJobsMock[index].title),
              subtitle: Text(myJobsMock[index].city),
              trailing: Text(myJobsMock[index].hourRate),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobDetailPage(
                              jobPostModel: myJobsMock[index],
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
                      content: Text("Job deleted with success."), duration: const Duration(seconds: 1),
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
      return JobPostModel(
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
                              jobPostModel: allJobsMock[index],
                            )));
              },
            ),
          );
        },
      ),
    );
  }
}
