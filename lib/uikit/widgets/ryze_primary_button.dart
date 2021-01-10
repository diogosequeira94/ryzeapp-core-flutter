import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class RyzePrimaryButton extends StatelessWidget {
  final String title;
  final Function action;
  final bool isLoading;
  final bool isAffirmative;

  const RyzePrimaryButton(
      {@required this.title,
      @required this.action,
      this.isLoading = false,
      @required this.isAffirmative});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isAffirmative
                        ? Theme.of(context).buttonColor
                        : Color(0xFF0b0b0d),
                    isAffirmative
                        ? Theme.of(context).accentColor
                        : Color(0xFF1d1e22),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(50.0))),
            child: Center(
              child: isLoading
                  ? CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )
                  : Text(
                      title,
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          ),
          onTap: () => action()),
    );
  }
}
