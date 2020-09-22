import 'package:get_it/get_it.dart';
import 'package:provider_practice/providers/buttonprovider.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton(() => ButtonProvider());
}