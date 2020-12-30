import 'package:flutter/material.dart';

class ProfilePageSection extends StatelessWidget {
  final String title;
  final String body;

  ProfilePageSection({
    @required this.title,
    @required this.body
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 6),
          Text(
            body,
            style: TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
