import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  final String title;
  final String body;
  const DetailsSection(this.title, this.body);
  @override
  Widget build(BuildContext context) {
    return body != null && body.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6.0),
              Text(
                body ?? '',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
