import 'package:firebaseblocryze/features/help_and_support/pages/insurance_page.dart';
import 'package:flutter/material.dart';

import '../section_header_widget.dart';

class FaqSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listTilePadding = const EdgeInsets.symmetric(horizontal: 0.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'F.A.Q'),
        ListTile(
          contentPadding: listTilePadding,
          title: Text('How to start your first job'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          contentPadding: listTilePadding,
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
          contentPadding: listTilePadding,
          title: Text('Check-in and Checkout'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        ListTile(
          contentPadding: listTilePadding,
          title: Text('Terms of Contract'),
          trailing: const Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
      ],
    );
  }
}
