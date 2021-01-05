import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class OnBoardingBodySection extends StatelessWidget {
  final String title, body, imagePath;

  const OnBoardingBodySection({
    @required this.title,
    @required this.body,
    this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(imagePath ?? LoginStrings.appLogoPath, width: 200, height: 200),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 26.0),
            ),
          ),
          Text(
            body,
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
