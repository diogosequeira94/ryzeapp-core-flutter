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
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black54,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Icon(
          isSelected ? Icons.favorite : Icons.favorite_border_rounded,
          color: Colors.black87,
          size: 16.0,
        ),
      ),
    );
  }
}
