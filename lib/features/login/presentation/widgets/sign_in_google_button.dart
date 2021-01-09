import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:flutter/material.dart';

class SignInGoogleButton extends StatelessWidget {
  final Function action;

  SignInGoogleButton({@required this.action});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(LoginStrings.googleIconPath, width: 24.0, height: 24.0),
              SizedBox(width: 5.0),
              Text(
                LoginStrings.signInGoogleButton,
              ),
            ],
          ),
        ),
        onTap: action);
  }
}
