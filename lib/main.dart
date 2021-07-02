import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'shell_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(ShellWidget());
}
