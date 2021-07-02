import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CheckInPageHeader extends StatelessWidget {
  final String userName;
  CheckInPageHeader({@required this.userName});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'JOB CHECK IN',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          '$userName has arrived and you are now both set to work! Just hit the start button and the bottom to begin your shift. Note that you can always end your shift earlier, if something unexpected comes up.',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
