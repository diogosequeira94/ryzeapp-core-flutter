import 'package:flutter/material.dart';

class HomePageSectionHeader extends StatelessWidget {
  final String title;
  final EdgeInsets edgeInsets;
  const HomePageSectionHeader({@required this.title, this.edgeInsets = const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 6.0),});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}