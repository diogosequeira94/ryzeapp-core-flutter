import 'package:flutter/material.dart';

class StartingPointPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Success Page',
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
      ),
      body: Center(
        child: Text('SUCCESS YOU CAN NOW START WORKING'),
      ),
    );
  }
}
