import 'package:get_it/get_it.dart';
import 'package:provider_practice/providers/buttonprovider.dart';
import 'package:provider_practice/providers/taskprovider.dart';
import 'package:provider_practice/services/TaskService.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => ButtonProvider());
  locator.registerLazySingleton(() => TaskService());
  locator.registerLazySingleton(() => TaskProvider());
}