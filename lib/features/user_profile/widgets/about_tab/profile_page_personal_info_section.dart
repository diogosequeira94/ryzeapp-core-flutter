import 'package:flutter/material.dart';

class ProfilePagePersonalInfo extends StatelessWidget {
  final String email;
  final String dateOfBirth;
  final String city;
  final String phoneNumber;

  ProfilePagePersonalInfo({
    @required this.email,
    @required this.dateOfBirth,
    @required this.city,
    @required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Email: $email',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          if (dateOfBirth != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Date of Birth: $dateOfBirth',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          if (city != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Location: $city',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          if (phoneNumber != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Phone Number: $phoneNumber',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          SizedBox(height: 8.0),
          Text(
            'Drivers Licence: Yes',
            style: TextStyle(fontSize: 14.0),
          ),
          const SizedBox(height: 8.0),
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
