import 'package:flutter/material.dart';

class JobDismissBackground extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final Alignment iconAlignment;

  const JobDismissBackground({
    @required this.bgColor,
    @required this.icon,
    @required this.iconAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        color: bgColor,
        child: Align(
            alignment: iconAlignment,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(icon, color: Colors.white),
            )),
      ),
    );
  }
}
