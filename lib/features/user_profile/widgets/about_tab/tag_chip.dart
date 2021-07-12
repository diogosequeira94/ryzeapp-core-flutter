import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String text;
  const TagChip(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.0, bottom: 4.0, left: 8.0, right: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      margin: const EdgeInsets.only(top: 12.0, right: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              style:
                  TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
