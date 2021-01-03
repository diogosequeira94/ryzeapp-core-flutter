import 'package:firebaseblocryze/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'features/login/presentation/core/app_widget.dart';

void main(){
  configureInjection(Environment.prod);
  runApp(AppWidget());
}
