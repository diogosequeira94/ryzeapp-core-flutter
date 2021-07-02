import 'package:firebaseblocryze/features/account/presentation/pages/account_overview_page.dart';
import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:firebaseblocryze/features/explore/presentation/explore_map_page.dart';
import 'package:firebaseblocryze/features/explore/presentation/explore_overview_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/home_page.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          if (state is BottomNavigationHomePageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BottomNavigationHomePageLoaded) {
            return HomePage();
          } else if (state is BottomNavigationAccountPageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BottomNavigationAccountPageLoaded) {
            return BlocProvider.value(
                value: BlocProvider.of<UserBloc>(context),
                child: AccountOverviewPage());
          } else if (state is BottomNavigationExplorePageLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BottomNavigationExplorePageLoaded) {
            return BlocProvider.value(
                value: BlocProvider.of<BottomNavigationBarBloc>(context),
                child: ExploreOverviewPage());
          } else if (state is BottomNavigationExploreMapLoaded) {
            return BlocProvider.value(
                value: BlocProvider.of<JobsBloc>(context),
                child: ExploreMapPage());
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
              builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              context
                  .read<BottomNavigationBarBloc>()
                  .add(BottomNavigationHomePagePressed());
            }
            if (index == 1) {
              context
                  .read<BottomNavigationBarBloc>()
                  .add(BottomNavigationExplorePagePressed());
            }
            if (index == 2) {
              context
                  .read<BottomNavigationBarBloc>()
                  .add(BottomNavigationAccountPagePressed());
            }
            setState(() {
              _currentIndex = index;
            });
          },
        );
      }),
    );
  }
}
