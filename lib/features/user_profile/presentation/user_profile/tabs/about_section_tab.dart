import 'package:firebaseblocryze/features/home_page/utils/home_page_strings.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/about_tab/profile_page_personal_info_section.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutSectionTab extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    final userBlocState = BlocProvider.of<UserBloc>(context).state;
    final userProfileInfo =
        userBlocState is UserLoadSuccess ? userBlocState.userProfile : null;

    print(userProfileInfo.email);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePageSection(
            title: UserProfileString.aboutSection, body: userProfileInfo.about),
        ProfilePagePersonalInfo(
            email: userProfileInfo.email,
            dateOfBirth: userProfileInfo.dateOfBirth,
            city: userProfileInfo.city),
        ProfilePageSection(
          title: UserProfileString.skillsSection,
          body: HomePageStrings.dummyProfileSection,
        ),
      ],
    );
  }
}
