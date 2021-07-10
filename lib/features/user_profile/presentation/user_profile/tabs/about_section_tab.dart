import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/about_tab/profile_page_personal_info_section.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/about_tab/skills_tags_section.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_section.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutSectionTab extends StatelessWidget {
  /// This injected property comes from a Notification
  final UserProfile userProfile;
  AboutSectionTab(this.userProfile);
  @override
  Widget build(BuildContext context) {
    final userBlocState = BlocProvider.of<UserBloc>(context).state;
    final globalUserProfile =
        userBlocState is UserLoadSuccess ? userBlocState.userProfile : null;
    final userProfileInfo = userProfile ?? globalUserProfile;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfilePageSection(
              title: UserProfileString.aboutSection,
              body: userProfileInfo.about),
          ProfilePagePersonalInfo(
              email: userProfileInfo.email,
              dateOfBirth: userProfileInfo.dateOfBirth,
              city: userProfileInfo.city,
              phoneNumber: userProfileInfo.phoneNumber),
          SkillTagsSection(),
        ],
      ),
    );
  }
}
