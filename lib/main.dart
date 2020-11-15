import 'package:firebaseblocryze/features/login_feature/presentation/core/app_widget.dart';
import 'package:firebaseblocryze/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main(){
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
