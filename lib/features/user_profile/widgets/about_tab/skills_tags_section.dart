import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class SkillTagsSection extends StatefulWidget {
  @override
  _SkillTagsSectionState createState() => _SkillTagsSectionState();
}

class _SkillTagsSectionState extends State<SkillTagsSection> {
  final editionMode = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UserProfileString.skillsSection,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
          Container(
            padding: const EdgeInsets.only(top: 12.0),
            child: TextFieldTags(
              initialTags: ["Restaurant", "Mentoring"],
              tagsStyler: TagsStyler(
                tagTextPadding: const EdgeInsets.all(4.0),
                showHashtag: false,
                tagMargin: const EdgeInsets.only(right: 16.0),
                tagCancelIcon:
                   editionMode ? Icon(Icons.cancel, size: 15.0, color: Colors.black) : SizedBox.shrink(),
                tagCancelIconPadding:
                    EdgeInsets.only(left: 4.0, top: 2.0, right: 2.0),
                tagPadding: EdgeInsets.only(
                    top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
                tagDecoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                tagTextStyle: TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.white),
              ),
              textFieldStyler: TextFieldStyler(
                textFieldEnabled: false,
                hintText: "Tags",
                isDense: false,
                textFieldBorder: InputBorder.none,
                textFieldFocusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3.0),
                ),
              ),
              onDelete: (tag) {},
              onTag: (String tag) {
                print(tag);
              },
              validator: (String tag) {
                if (tag.length > 10) {
                  return "You reached the max limit";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
