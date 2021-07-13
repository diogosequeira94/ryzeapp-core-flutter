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
                const Icon(Icons.refresh_rounded),
                const SizedBox(width: 12.0),
                const Text('Refresh'),
              ],
            ),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                const Icon(Icons.favorite_border_rounded),
                const SizedBox(width: 12.0),
                const Text('Favourites'),
              ],
            ),
          ),
        ],
        child: Icon(
          Icons.more_vert,
        ),
      ),
    );
  }
}
