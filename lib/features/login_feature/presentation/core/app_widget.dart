import 'package:firebaseblocryze/features/login_feature/presentation/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RyzeApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurpleAccent,
        accentColor: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
          ),
        )
      ),
      home: SignInPage(),
    );
  }
}