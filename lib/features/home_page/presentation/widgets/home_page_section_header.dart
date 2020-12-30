import 'package:flutter/material.dart';

class HomePageSectionHeader extends StatelessWidget {
  final String title;
  const HomePageSectionHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}