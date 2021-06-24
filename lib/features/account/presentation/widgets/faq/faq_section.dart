import 'package:firebaseblocryze/features/help_and_support/pages/insurance_page.dart';
import 'package:flutter/material.dart';

import '../section_header_widget.dart';

class FaqSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'F.A.Q'),
        ListTile(
          title: Text('How to start your first job'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Do I need an Insurance?'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InsurancePage()),
            );
          },
        ),
        ListTile(
          title: Text('Check-in and Checkout'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          title: Text('Terms of Contract'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
      ],
    );
  }
}
