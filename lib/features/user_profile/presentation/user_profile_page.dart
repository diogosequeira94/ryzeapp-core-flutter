import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_header.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfilePageHeaderWidget(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    HomePageStrings.dummyProfileSection + HomePageStrings.dummyProfileSection,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job Statistics',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Jobs Completed: 3',
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'No shows: 0',
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Average Performance:',
                        style: TextStyle(fontSize: 14.0, color: Colors.black54),
                      ),
                      Icon(Icons.star, size: 18.0, color: Colors.amber),
                      Icon(Icons.star, size: 18.0, color: Colors.amber),
                      Icon(Icons.star, size: 18.0, color: Colors.amber),
                      Icon(Icons.star, size: 18.0, color: Colors.amber),
                      Icon(Icons.star, size: 18.0, color: Colors.amber),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Email: diogocnsequeira@gmail.com',
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Date of Birth: 6/5/1994',
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Location: Lisbon Area',
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Drivers Licence: Yes',
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Education',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    HomePageStrings.dummyProfileSection,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Skills',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    HomePageStrings.dummyProfileSection,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Attachments',
                    style:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 6),
                  Text(
                    HomePageStrings.dummyProfileSection,
                    style: TextStyle(fontSize: 14.0, color: Colors.black54),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}