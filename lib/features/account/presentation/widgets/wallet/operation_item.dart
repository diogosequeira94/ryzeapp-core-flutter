import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class OperationItem extends StatelessWidget {
  final String title;
  final Icon operationIcon;

  const OperationItem({@required this.title, @required this.operationIcon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, right: 22.0, bottom: 2.0),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Material(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16.0),
              elevation: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white.withOpacity(0.4),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(child: operationIcon),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
