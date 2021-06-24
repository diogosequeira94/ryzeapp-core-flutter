import 'package:flutter/material.dart';

import '../section_header_widget.dart';

class LegalPoliciesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'Legal'),
        ListTile(
          title: Text('Terms and conditions '),
          onTap: () {},
        ),
        ListTile(
          title: Text('Privacy'),
          onTap: () {},
        ),
      ],
    );
  }
}
