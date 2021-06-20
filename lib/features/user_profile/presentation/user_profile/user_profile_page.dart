import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/about_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/activity_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/education_section_tab.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_mocks.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/profile_page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  final user = UserMocks.getMockUser();
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final userId = authBloc.userId;
    userBloc.add(UserProfileFetched(userId: userId));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          UserProfileString.profileTitle,
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed('/edit-profile');
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfilePageHeaderWidget(user: user),
              Padding(
                padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 2.0,
                ),
              ),
              _TabsSection(),
            ],
          ),
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
