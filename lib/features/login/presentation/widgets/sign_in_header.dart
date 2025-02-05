import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).buttonColor,
                    Theme.of(context).accentColor,
                  ],
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(84.0))
            ),
            child: Center(
              child: Image.asset(LoginStrings.appLogoCirclePath,
                width: 135.0,
                height: 135.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
