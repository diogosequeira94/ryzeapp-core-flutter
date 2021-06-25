import 'package:flutter/material.dart';

class AddToFavouritesIcon extends StatefulWidget {
  @override
  _AddToFavouritesIconState createState() => _AddToFavouritesIconState();
}

class _AddToFavouritesIconState extends State<AddToFavouritesIcon> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Icon(
        isSelected ? Icons.favorite : Icons.favorite_border_rounded,
        color: Colors.black87,
        size: 16.0,
      ),
    );
  }
}
