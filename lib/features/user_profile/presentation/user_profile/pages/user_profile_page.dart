import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/tabs/about_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/tabs/activity_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/tabs/education_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/common/profile_page_header.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    final userId = BlocProvider.of<AuthBloc>(context).userId;
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          UserProfileString.profileTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
        actions: [
          BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserLoadSuccess) {
              return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/edit-profile',
                      arguments: state.userProfile,
                    );
                  });
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is UserLoadSuccess) {
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
                  _TabsSection(),
                ],
              );
            } else if (state is UserLoadInProgress) {
              return Container(
                height: 400,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is UserLoadFailure) {
              return Center(
                child: Column(
                  children: [
                    Text('Oops, something went wrong!'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RyzePrimaryButton(
                          title: 'Retry',
                          action: () {
                            userBloc.add(UserProfileFetched(userId: userId));
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
              AboutSectionTab(),
              EducationSectionTab(),
              ActivitySectionTab(),
            ]),
          ),
        ],
      ),
    );
  }
}
