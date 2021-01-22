import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_job_statistics.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_header.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_personal_info_section.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_section.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';

class EditInformationPage extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          UserProfileString.editProfileTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePageHeaderWidget(user: user),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 6.0, right: 6.0),
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 2.0,
                ),
              ),
              ProfilePageSection(
                  title: UserProfileString.aboutSection, body: user.about),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: RyzePrimaryButton(
                    title: 'Save Changes',
                    action: () => Navigator.pop(context),
                    isAffirmative: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
