import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:flutter/material.dart';

class JobStatistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UserProfileString.statisticsSection,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Jobs Completed: 3',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 4),
          Text(
            'No shows: 0',
            style: TextStyle(fontSize: 14.0),
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Average Performance:',
                style: TextStyle(fontSize: 14.0),
              ),
              Icon(Icons.star, size: 18.0, color: Colors.amber),
              Icon(Icons.star, size: 18.0, color: Colors.amber),
              Icon(Icons.star, size: 18.0, color: Colors.amber),
              Icon(Icons.star, size: 18.0, color: Colors.amber),
              Icon(Icons.star, size: 18.0, color: Colors.amber),
            ],
          ),
          const SizedBox(height: 6),
          Divider(
            color: Colors.grey[300],
            thickness: 2.0,
            indent: 8.0,
            endIndent: 8.0,
          )
        ],
      ),
    );
  }
}
