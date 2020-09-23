import 'package:flutter/cupertino.dart';
import 'package:provider_practice/AppEnviroment.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/main.dart';

void main(){
  setupLocator();
  AppEnvironment.setupEnv(Environment.prod);
  runApp(MyApp());
}