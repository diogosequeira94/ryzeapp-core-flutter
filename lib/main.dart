import 'package:firebaseblocryze/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'features/login_feature/presentation/pages/sign_in_screen.dart';

void main(){
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
    );
  }
}
