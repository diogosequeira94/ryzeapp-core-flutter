import 'package:flutter/material.dart';

class ProfilePagePersonalInfo extends StatelessWidget {
  final String email;
  final String dateOfBirth;
  final String city;

  ProfilePagePersonalInfo({
    @required this.email,
    @required this.dateOfBirth,
    @required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal',
            style:
            TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 6),
          Text(
            'Email: $email',
            style: TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
          SizedBox(height: 6),
          Text(
            'Date of Birth: $dateOfBirth',
            style: TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
          SizedBox(height: 6),
          Text(
            'Location: $city',
            style: TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
          SizedBox(height: 6),
          Text(
            'Drivers Licence: Yes',
            style: TextStyle(fontSize: 14.0, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
