import 'package:flutter/material.dart';

class JobCategoryPageHeader extends StatelessWidget {
  final String title, description;
  JobCategoryPageHeader(this.title, this.description);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        const Divider(thickness: 2),
      ],
    );
  }
}
