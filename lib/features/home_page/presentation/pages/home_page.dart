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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Trending',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            NewsCarouselSliderWidget(),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'All Jobs',
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
    final myJobsMock = ['Bartender', 'Android Developer'];
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: myJobsMock.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(myJobsMock[index]),
          subtitle: Text('Lisbon Area'),
          trailing: Text('10€ / hr'),
          onTap: () {},
        );
      },
    );
  }

  Widget _allJobPosts(BuildContext context) {
    final allJobsMock = [
      'Bartender',
      'Android Developer',
      'Hotel Cleaner',
      'Delivery Driver',
      'Gardner',
      'Library Helper',
      'Officer',
      'Tax Consultant',
      'Lawyer'
    ];

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allJobsMock.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(allJobsMock[index]),
          subtitle: Text('Lisbon Area'),
          trailing: Text('10€ / hr'),
          onTap: () {},
        );
      },
    );
  }
}
