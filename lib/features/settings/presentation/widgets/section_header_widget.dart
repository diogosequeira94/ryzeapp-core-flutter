import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {

  final String title;
  const SectionHeader({@required this.title});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}
