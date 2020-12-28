import 'package:firebaseblocryze/features/home_page/presentation/model/job_model.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/job_post_dummy.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job_detail_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/categories_grid.dart';
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
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
              child: Text(
                'Your Job Posts',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            _myJobPosts(context),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
              child: Text(
                'Job Categories',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            CategoriesGridWidget(),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
              child: Text(
                'Trending',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
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
