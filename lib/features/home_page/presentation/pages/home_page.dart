import 'package:firebaseblocryze/features/home_page/presentation/model/job_model.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/job_post_dummy.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job_detail_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/categories_grid.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/news_carrousel_slider.dart';
import 'package:firebaseblocryze/features/settings/presentation/widgets/section_header_widget.dart';
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
            SectionHeader(title: 'Your Job Posts'),
            _myJobPosts(context),
            SectionHeader(title: 'Job Categories'),
            const SizedBox(height: 8.0),
            CategoriesGridWidget(),
            const SizedBox(height: 8.0),
            SectionHeader(title: 'Trending'),
            _allJobPosts(context),
          ],
        ),
    );
  }

  Widget _myJobPosts(BuildContext context) {
    final myJobsMock = DUMMY_MY_JOBS.map((job){
      return JobPostModel(
          title: job.title,
          description: job.description,
          hourRate: job.hourRate,
          imageUrl: job.imageUrl,
          city: job.city,
          isRemote: job.isRemote,
          slotsAvailable: job.slotsAvailable,
          languages: job.languages
      );
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
                    MaterialPageRoute(builder: (context) => JobDetailPage(jobPostModel: myJobsMock[index],)));
              },
            ),
          );
        },
      ),
    );
  }

  Widget _allJobPosts(BuildContext context) {
   final allJobsMock = DUMMY_ALL_JOBS.map((job){
      return JobPostModel(
        title: job.title,
        description: job.description,
        hourRate: job.hourRate,
        imageUrl: job.imageUrl,
        city: job.city,
        isRemote: job.isRemote,
        slotsAvailable: job.slotsAvailable,
        languages: job.languages
      );
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
                    MaterialPageRoute(builder: (context) => JobDetailPage(jobPostModel: allJobsMock[index],)));
              },
            ),
          );
        },
      ),
    );
  }
}
