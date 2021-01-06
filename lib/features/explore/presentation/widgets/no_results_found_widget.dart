import 'package:flutter/material.dart';

class NoResultsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search_off_outlined, size: 80, color: Colors.black45),
          const SizedBox(height: 24.0),
          Text(
              'Oops! We couldnt find any results for what you searched for.',
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
