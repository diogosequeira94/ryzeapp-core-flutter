import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_job_statistics.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_section.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_reviews_section.dart';
import 'package:flutter/material.dart';

class ActivitySectionTab extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JobStatistics(),
        ProfileReviews(),
      ],
    );
  }
}
