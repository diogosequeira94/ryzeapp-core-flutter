import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_header.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_personal_info_section.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_section.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          UserProfileString.profileTitle,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.edit), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePageHeaderWidget(user: user),
              SizedBox(height: 16),
              ProfilePageSection(
                  title: UserProfileString.aboutSection, body: user.about),
              buildJobStatistics(),
              ProfilePagePersonalInfo(
                  email: user.email,
                  dateOfBirth: user.dateOfBirth,
                  city: user.currentCity),
              ProfilePageSection(
                  title: UserProfileString.educationSection,
                  body: HomePageStrings.dummyProfileSection),
              ProfilePageSection(
                  title: UserProfileString.skillsSection,
                  body: HomePageStrings.dummyProfileSection),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: ProfilePageSection(
                    title: UserProfileString.attachmentsSection,
                    body: HomePageStrings.dummyProfileSection),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildJobStatistics(){
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UserProfileString.statisticsSection,
            style:
            TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
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
    );
  }
}
