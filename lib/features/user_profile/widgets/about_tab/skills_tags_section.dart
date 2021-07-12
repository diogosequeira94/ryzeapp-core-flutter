import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/about_tab/tag_chip.dart';
import 'package:flutter/material.dart';

class SkillTagsSection extends StatefulWidget {
  @override
  _SkillTagsSectionState createState() => _SkillTagsSectionState();
}

class _SkillTagsSectionState extends State<SkillTagsSection> {
  final editionMode = false;
  @override
  Widget build(BuildContext context) {
    final List<String> mockTags = ['Cleaner', 'Bartender', 'Fast', 'Humble'];
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            UserProfileString.skillsSection,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      for (var title in mockTags) TagChip(title)
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
