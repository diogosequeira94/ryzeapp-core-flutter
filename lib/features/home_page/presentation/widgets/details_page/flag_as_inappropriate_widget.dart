import 'package:flutter/material.dart';

class FlagAsInappropriate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () {},
        child: Row(children: [
          Icon(Icons.flag, color: Theme.of(context).accentColor),
          const SizedBox(width: 3.0),
          Flexible(
            child: Text(
              'Flag as inappropriate',
              style: TextStyle(color: Theme.of(context).accentColor),
            ),
          )
        ]),
      ),
    );
  }
}
