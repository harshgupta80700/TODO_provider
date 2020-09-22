import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_practice/locator.dart';
import 'package:provider_practice/providers/buttonprovider.dart';
import 'package:provider_practice/providers/taskprovider.dart';

List<SingleChildWidget> supplyProvider(){
  return [
    ChangeNotifierProvider(
      create: (_) => locator<ButtonProvider>(),
    ),
    ChangeNotifierProvider(
      create: (_) => locator<TaskProvider>(),
    ),
  ];
}