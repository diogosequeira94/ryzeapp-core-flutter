import 'package:flutter/material.dart';

class HorizontalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: double.infinity,
        height: 1.0,
        color: Colors.grey.shade400);
  }
}
