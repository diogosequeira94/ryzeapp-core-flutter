import 'package:firebaseblocryze/features/home_page/presentation/widgets/categories_grid.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/news_carrousel_slider.dart';
import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('RyzeApp Home'),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      backgroundColor: Color(0xfff8f8f8),
      body: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black38)),
                  color: Colors.deepPurpleAccent,
                  child: const Text(
                    HomePageStrings.signOutButton,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _myJobPosts(BuildContext context) {

    // backing data
    final europeanCountries = ['Bartender', 'Android Developer'];

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: europeanCountries.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(europeanCountries[index]),
          subtitle: Text('Lisbon Area'),
          trailing: Text('10€ / hr'),
          onTap: (){},
        );
      },
    );
  }

  Widget _allJobPosts(BuildContext context) {

    // backing data
    final europeanCountries = ['Bartender', 'Android Developer', 'Hotel Cleaner', 'Delivery Driver', 'Gardner', 'Library Helper', 'Officer', 'Tax Consultant', 'Lawyer'];

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: europeanCountries.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(europeanCountries[index]),
          subtitle: Text('Lisbon Area'),
          trailing: Text('10€ / hr'),
          onTap: (){},
        );
      },
    );
  }
}
