import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class OperationItem extends StatelessWidget {
  final String title;
  final Icon operationIcon;

  const OperationItem({@required this.title, @required this.operationIcon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, right: 8.0, bottom: 2.0),
      child: GestureDetector(
        onTap: () {},
        child: Material(
          borderRadius: BorderRadius.circular(15.0),
          elevation: 1.0,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).cardColor.withOpacity(0.3),
                    spreadRadius: 2.0,
                    blurRadius: 3.0,
                  ),
                ],
                color: Theme.of(context).cardColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Container(child: operationIcon),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
