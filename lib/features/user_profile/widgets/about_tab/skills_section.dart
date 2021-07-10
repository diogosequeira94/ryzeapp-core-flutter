import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SkillTagsSection extends StatefulWidget {
  SkillTagsSection({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SkillTagsSectionState createState() => _SkillTagsSectionState();
}

class _SkillTagsSectionState extends State<SkillTagsSection> {
  List<String> suggestedTagsList = ['apple', 'banana', 'orange', 'kiwi', ''];
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            TypeAheadField(
              textFieldConfiguration:
              TextFieldConfiguration(onSubmitted: (val) {
                _addSuggestion(val);
              }),
              hideOnLoading: true,
              hideOnEmpty: true,
              getImmediateSuggestions: false,
              onSuggestionSelected: (val) {
                _onSuggestionSelected(val);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(
                    suggestion,
                  ),
                );
              },
              suggestionsCallback: (val) {
                return _suggestionList(
                  tags: suggestedTagsList,
                  suggestion: val,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            _generateTags()
          ],
        ),
      ),
    );
  }

  _onSuggestionRemoved(String value) {
    final String exists =
    selectedTags.firstWhere((text) => text == value, orElse: () {
      return null;
    });
    if (exists != null) {
      setState(() {
        selectedTags.remove(value);
        suggestedTagsList.add(value);
      });
    }
  }

  _addSuggestion(String value) {
    final exists =
    suggestedTagsList.firstWhere((text) => text == value, orElse: () {
      return null;
    });
    if (exists != null) {
      final String isAlreadyInSelectedList =
      selectedTags.firstWhere((text) => text == value, orElse: () {
        return null;
      });
      if (isAlreadyInSelectedList == null) {
        setState(() {
          selectedTags.add(value);
          suggestedTagsList.remove(value);
        });
      }
    } else {
      final String isAlreadyInSelectedList =
      selectedTags.firstWhere((text) => text == value, orElse: () {
        return null;
      });
      if (isAlreadyInSelectedList == null) {
        setState(() {
          selectedTags.add(value);
        });
      }
    }
  }

  _onSuggestionSelected(String value) {
    final String exists =
    suggestedTagsList.firstWhere((text) => text == value, orElse: () {
      return null;
    });
    if (exists != null) {
      final String isAlreadyInSelectedList =
      selectedTags.firstWhere((text) => text == value, orElse: () {
        return null;
      });

      if (isAlreadyInSelectedList == null) {
        setState(() {
          selectedTags.add(value);
          suggestedTagsList.remove(value);
        });
      }
    }
  }

  _suggestionList({@required List<String> tags, @required String suggestion}) {
    List<String> modifiedList = [];
    modifiedList.addAll(tags);
    modifiedList.retainWhere(
            (text) => text.toLowerCase().contains(suggestion.toLowerCase()));
    if (suggestion.length >= 2) {
      return modifiedList;
    } else {
      return null;
    }
  }

  _generateTags() {
    return selectedTags.isEmpty
        ? Container()
        : Container(
      alignment: Alignment.topLeft,
      child: Tags(
        alignment: WrapAlignment.center,
        itemCount: selectedTags.length,
        itemBuilder: (index) {
          return ItemTags(
            index: index,
            title: selectedTags[index],
            color: Colors.blue,
            activeColor: Colors.red,
            onPressed: (Item item) {},
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            elevation: 0.0,
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
            textColor: Colors.white,
            textActiveColor: Colors.white,
            removeButton: ItemTagsRemoveButton(
                color: Colors.black,
                backgroundColor: Colors.transparent,
                size: 14,
                onRemoved: () {
                  _onSuggestionRemoved(selectedTags[index]);
                  return true;
                }),
            textOverflow: TextOverflow.ellipsis,
          );
        },
      ),
    );
  }
}
