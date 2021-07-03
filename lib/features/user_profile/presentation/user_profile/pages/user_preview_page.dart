import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/cubit/user_preview/user_preview_cubit.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/tabs/about_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/tabs/activity_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/tabs/education_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_header.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          UserProfileString.profileTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<UserPreviewCubit, UserPreviewState>(
              builder: (context, state) {
            if (state is UserProfilePreviewSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfilePageHeaderWidget(user: state.userProfile),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: 2.0,
                    ),
                  ),
                  _TabsSection(state.userProfile),
                ],
              );
            } else if (state is UserProfilePreviewInProgress) {
              return Container(
                height: 400,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              );
            } else if (state is UserProfilePreviewFailure) {
              return Center(
                child: Column(
                  children: [
                    Text('Oops, something went wrong!'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RyzePrimaryButton(
                          title: 'Retry',
                          action: () {
                            userBloc.add(UserProfilePreviewFetched(userId: ''));
                          },
                          isAffirmative: false),
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox.shrink(
                key: Key('warrantyHub_emptyView'),
              );
            }
          }),
        ),
      ),
    );
  }
}

class _TabsSection extends StatelessWidget {
  final UserProfile userProfile;
  _TabsSection(this.userProfile);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
                labelColor: Theme.of(context).textTheme.headline6.color,
                indicatorColor: Theme.of(context).accentColor,
                tabs: [
                  Tab(text: "ABOUT"),
                  Tab(text: "EDUCATION"),
                  Tab(text: "ACTIVITY"),
                ]),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: TabBarView(children: [
              AboutSectionTab(userProfile),
              EducationSectionTab(),
              ActivitySectionTab(),
            ]),
          ),
        ],
      ),
    );
  }
}
