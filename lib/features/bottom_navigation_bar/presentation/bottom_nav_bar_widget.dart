import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/home_page.dart';
import 'package:firebaseblocryze/features/settings/presentation/pages/settings_overview_page.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white ,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'RyzeApp',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
        builder: (context, state) {
          if (state is BottomNavigationHomePageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is BottomNavigationHomePageLoaded) {
            return HomePage();
          }
          if (state is BottomNavigationSettingsPageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is BottomNavigationSettingsPageLoaded) {
            return SettingsOverviewPage();
          }
          return Container();
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
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
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
                  .add(BottomNavigationSettingsPagePressed());
              print('Settings Page Pressed');
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
