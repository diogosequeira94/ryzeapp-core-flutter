import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class OperationItem extends StatelessWidget {
  final String title;
  final Icon operationIcon;

  const OperationItem({@required this.title, @required this.operationIcon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Container(
          width: 120.0,
          height: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white70,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              operationIcon,
              const SizedBox(height: 8.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed('/payment-error'),
    );
  }
}
