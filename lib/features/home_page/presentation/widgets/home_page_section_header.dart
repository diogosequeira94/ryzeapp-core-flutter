import 'package:flutter/material.dart';

class HomePageSectionHeader extends StatelessWidget {
  final String title;
  const HomePageSectionHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 6.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}