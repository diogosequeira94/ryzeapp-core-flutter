import 'package:flutter/material.dart';

import '../section_header_widget.dart';

class LegalPoliciesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listTilePadding = const EdgeInsets.symmetric(horizontal: 0.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: 'Legal'),
        ListTile(
          contentPadding: listTilePadding,
          title: Text('Terms and conditions '),
          onTap: () {},
        ),
        ListTile(
          contentPadding: listTilePadding,
          title: Text('Privacy'),
          onTap: () {},
        ),
      ],
    );
  }
}
