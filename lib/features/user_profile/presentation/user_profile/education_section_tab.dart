import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_section.dart';
import 'package:flutter/material.dart';

class EducationSectionTab extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
