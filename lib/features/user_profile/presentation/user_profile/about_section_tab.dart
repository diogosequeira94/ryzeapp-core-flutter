import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_personal_info_section.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_section.dart';
import 'package:flutter/material.dart';

class AboutSectionTab extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePageSection(
            title: UserProfileString.aboutSection, body: user.about),
        ProfilePagePersonalInfo(
            email: user.email,
            dateOfBirth: user.dateOfBirth,
            city: user.currentCity),
        ProfilePageSection(
            title: UserProfileString.skillsSection,
            body: HomePageStrings.dummyProfileSection),
      ],
    );
  }
}
