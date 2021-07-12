import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_section.dart';
import 'package:flutter/material.dart';

class EducationSectionTab extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePageSection(
              title: UserProfileString.educationSection,
              body: 'You did not add anything to your education.'),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0, top: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Attachments',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16.0),
                Text('You did not add any attachments yet.'),
                const SizedBox(height: 12.0),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2.0,
                  indent: 4.0,
                  endIndent: 4.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AttachmentsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: ProfilePageSection(
          title: UserProfileString.attachmentsSection,
          body: HomePageStrings.dummyProfileSection),
    );
  }
}
