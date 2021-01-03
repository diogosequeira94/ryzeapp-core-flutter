import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.7,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF3229bf),
                    Color(0xFF4568ff),
                  ],
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(84.0))
            ),
            child: Center(
              child: Icon(Icons.camera,
                size: 80.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
