import 'package:flutter/material.dart';

class JobDisclaimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.info_outline_rounded),
        const SizedBox(width: 8.0),
        Expanded(
            child: Text(
                'We always encourage you to show up 30 min prior to your shifts.', style: TextStyle(
            ),))
      ],
    );
  }
}
