import 'package:flutter/material.dart';

class SettingsDropdownIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Row(
              children: [
                Icon(Icons.favorite_border_rounded),
                Text('Favourites'),
              ],
            ),
          )
        ],
        child: Icon(
          Icons.more_vert,
        ),
      ),
    );
  }
}
