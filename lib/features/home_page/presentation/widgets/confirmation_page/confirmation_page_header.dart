import 'package:flutter/material.dart';

class ConfirmationPageHeader extends StatelessWidget {
  final String jobEntityName;
  ConfirmationPageHeader({@required this.jobEntityName});
  @override
  Widget build(BuildContext context) {
    final entityName = jobEntityName.trimRight() ?? 'Someone';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'CONGRATULATIONS',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '$entityName has accepted your work appliance and is looking forward to working with you! You can see all the details for your gig below.',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
