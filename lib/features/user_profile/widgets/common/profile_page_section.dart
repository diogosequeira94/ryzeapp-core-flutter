import 'package:flutter/material.dart';

class ProfilePageSection extends StatelessWidget {
  final String title;
  final String body;
  final bool hasDivider;

  ProfilePageSection({
    @required this.title,
    @required this.body,
    this.hasDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8.0),
          Text(
            body ??
                'Tell us a bit about yourself.',
            style: TextStyle(fontSize: 14.0),
          ),
          const SizedBox(height: 8.0),
          hasDivider
              ? Divider(
                  color: Colors.grey[300],
                  thickness: 2.0,
                  indent: 4.0,
                  endIndent: 4.0,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
