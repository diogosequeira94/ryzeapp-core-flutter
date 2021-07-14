import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:firebaseblocryze/platform/hive/model/job_post_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import 'shell_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedPrefs.init();
  await Hive.initFlutter();
  Hive.registerAdapter(JobPostModelAdapter());
  await Hive.openBox<JobPostModel>('jobs');
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(ShellWidget());
}
