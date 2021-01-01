import 'package:flutter/material.dart';

class HomePageSectionHeader extends StatelessWidget {
  final String title;
  const HomePageSectionHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}